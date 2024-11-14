package com.project.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CommEntity;
import com.project.entity.DealEntity;
import com.project.entity.MentEntity;
import com.project.entity.UserEntity;
import com.project.repository.CommRepository;
import com.project.repository.MentRepository;
import com.project.repository.UserRepository;

@Controller
public class CommController {

	// 게시물 repo
	@Autowired
	private CommRepository com_repo;
	
	// 댓글 repo
	@Autowired
    private MentRepository ment_repo;
	
	// 페이지당 표시할 게시물 수 설정
    private static final int PAGE_SIZE = 10;

	// 파일 저장 경로
	@Value("${file.upload-dir.commu}")
	private String uploadDir;

	@RequestMapping("/goComm")
	public String goComm(Model model, 
						@RequestParam(value = "page", defaultValue = "0") int page) {
		
		// 데이터베이스에서 게시물 목록을 조회
        List<CommEntity> posts = com_repo.findAll();

        // 페이지 정보를 포함한 게시물 조회
        Pageable pageable = PageRequest.of(page, PAGE_SIZE, Sort.by(Sort.Direction.DESC, "idx"));
        Page<CommEntity> postsPage = com_repo.findAll(pageable);

        // 인기글 (cb_views 상위 3개 조회)
        Pageable topThreePageable = PageRequest.of(0, 3, Sort.by(Sort.Direction.DESC, "views"));
        List<CommEntity> topThreePosts = com_repo.findAll(topThreePageable).getContent();
        
        // 페이지 정보와 게시물 리스트를 모델에 추가
        model.addAttribute("topThreePosts", topThreePosts);
        model.addAttribute("posts", postsPage.getContent());
        model.addAttribute("totalPages", postsPage.getTotalPages());
        model.addAttribute("currentPage", page);
		
		return "CommMain";
	}

	@RequestMapping("/goCommWrite")
	public String commWrite(HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "CommWrite";
		} else {
			return "login";
		}
	}

	@RequestMapping("/commContent")
	public String dealWrite(@RequestParam("cb_title") String title,
						    @RequestParam("cb_content") String content,
						    @RequestParam("cb_file") MultipartFile file,
						    @RequestParam("id") String userId,
						    RedirectAttributes redirectAttributes) {

		// 새로운 CommEntity 객체 생성 및 필드 설정
	    CommEntity comm_info = new CommEntity();
	    comm_info.setCb_title(title);
	    comm_info.setCb_content(content);
	    comm_info.setId(userId);
	    
	    // 현재 날짜와 시간 설정
	    LocalDateTime now = LocalDateTime.now();
	    Timestamp timestamp = Timestamp.valueOf(now);
	    comm_info.setCreated_at(timestamp);


	    // 파일 업로드 처리
	    if (!file.isEmpty()) {
	        String uuid = UUID.randomUUID().toString();
	        String filename = uuid + "_" + file.getOriginalFilename();

	        Path path = Paths.get(uploadDir + filename);

	        try {
	            file.transferTo(path);
	            comm_info.setCb_file(filename);
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("message", "File upload failed!");
	            return "CommWrite";
	        }
	    } else {
	        comm_info.setCb_file(null);
	    }

		// 나머지 필드 저장
		comm_info = com_repo.save(comm_info); // -> insert sql 문장 실행

		if (comm_info != null) {
			System.out.println("DB저장완료");
			return "redirect:/goComm";
		} else {
			System.out.println("DB저장실패");
			return "CommWrite";
		}
	}
	
	// 게시글 세부 내용 조회
	@RequestMapping("/goWriteDetail")
	public String postDetail(@RequestParam("idx") Integer idx, 
							Model model) {
       
		CommEntity post = com_repo.findById(idx).orElse(null);

        if (post == null) {
            model.addAttribute("message", "Post not found");
            System.out.println(model.getAttribute("message"));
            // return "errorPage";
        }
        
        // 조회수 증가
        post.setViews(post.getViews() + 1);
        com_repo.save(post);  // 업데이트된 조회수를 DB에 저장
        
        model.addAttribute("post", post);
        
        // 게시물에 달린 댓글 목록 불러오기
        List<MentEntity> comments = ment_repo.findByCbIdx(idx);
        System.out.println("댓글 수 : "+comments.size());
        model.addAttribute("comments", comments);

        return "CommDetail";
	}
	
	// 게시글 디테일 페이지에서 다시 목록으로 가기 위한 메소드
	@RequestMapping("/goPostList")
	public String postList() {
		return "redirect:/goComm";
	}
	
	// 댓글 저장
    @RequestMapping("/addComment")
    public String addComment(@RequestParam("cb_idx") Integer cb_idx,
                             @RequestParam("ccmt_content") String content,
                             HttpSession session, Model model) {

        // 세션에서 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login"; // 로그인 안 되어있으면 로그인 페이지로
        }

        // 새로운 댓글 엔티티 생성
        MentEntity comment = new MentEntity();
        comment.setCbIdx(cb_idx);
        comment.setCcmt_content(content);
        comment.setId(userId);

        // 현재 시간 설정
        LocalDateTime now = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(now);
        comment.setCreated_at(timestamp);
        
        comment.setCcmt_likes(0);

        // 댓글 저장
        ment_repo.save(comment);
        
        // 저장 후 해당 게시글로 리다이렉트
        return "redirect:/goWriteDetail?idx=" + cb_idx;
    }
	
    // 수정하기 --- 미완성 헤헤 
//    @RequestMapping("/editPost")
//    public String editPost(@RequestParam("idx") Integer idx, Model model) {
//        CommEntity post = com_repo.findById(idx).orElse(null);
//
//        if (post == null) {
//            return "errorPage";
//        }
//
//        model.addAttribute("post", post);
//        return "CommEdit";  // 수정 페이지로 이동
//    }
    
    // 게시물 삭제하기
    @RequestMapping("/deletePost")
    public String deletePost(@RequestParam("idx") Integer idx, HttpSession session) {
        CommEntity post = com_repo.findById(idx).orElse(null);

        if (post != null && session.getAttribute("userId").equals(post.getId())) {
            com_repo.delete(post);  // 게시글 삭제
        }

        return "redirect:/goComm";  // 게시글 목록 페이지로 리다이렉트
    }
    
}
