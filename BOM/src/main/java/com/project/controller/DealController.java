package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;
import com.project.entity.UserEntity;
import com.project.repository.DealRepository;
import com.project.repository.UserRepository;

@Controller
public class DealController {

	@Value("${file.upload-dir.board}")
	private String savePath;

	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	// 중고거래 게시판 메인페이지(역순정렬 -> 최신글이 제일 위에 보이게)
	@RequestMapping("/b_board")
	public String dealMain(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();
		model.addAttribute("deal", list);

		return "B_board";
	}

	// 중고거래 게시판 글 작성하기전에 로그인했는지 확인
	@RequestMapping("/goWrite")
	public String goWrite(HttpSession session) {

		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

		if (loginInfo == null) {
			return "login";
		} else {
			return "B_write";
		}
	}

	// 중고거래 게시판 작성
	@RequestMapping("/dealWrite")
	public String dealWrite(@RequestParam("b_title") String title, 
	                        @RequestParam("how_much") Long price,
	                        @RequestParam("category") String category, 
	                        @RequestParam("b_content") String description,
	                        @RequestPart("files[]") MultipartFile[] files,  // 수정된 부분
	                        HttpSession session, 
	                        RedirectAttributes redirectAttributes) {

	    String userId = (String) session.getAttribute("userId");
	    
	    // 파일이 비어 있는지 확인
	    if (files.length == 0 || files[0].isEmpty()) {
	        redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
	        return "redirect:/goWrite";
	    }
	    
	    // 파일 저장을 위한 StringBuilder를 사용해 파일 이름들을 연결할 수 있습니다.
	    StringBuilder filenames = new StringBuilder();
	    
	    for (MultipartFile file : files) {
	        if (!file.isEmpty()) {
	            String uuid = UUID.randomUUID().toString();
	            String filename = uuid + "_" + file.getOriginalFilename();
	            Path path = Paths.get(savePath + filename);

	            try {
	                // 파일 저장
	                Files.copy(file.getInputStream(), path);
	                // 파일 이름 추가
	                filenames.append(filename).append(";");
	            } catch (IOException e) {
	                e.printStackTrace();
	                redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
	                return "redirect:/goWrite";
	            }
	        }
	    }
	    
	    System.out.println("파일 개수: " + files.length);
	   
	    // DealEntity에 데이터 저장
	    DealEntity entity = new DealEntity();
	    entity.setB_title(title);
	    entity.setHow_much(price);
	    entity.setCategory(category);
	    entity.setB_content(description);
	    entity.setFilenames(filenames.toString()); // 모든 파일 이름들을 연결하여 저장
	    entity.setId(userId);

	    LocalDateTime now = LocalDateTime.now();
	    Timestamp timestamp = Timestamp.valueOf(now);
	    entity.setCreated_at(timestamp);

	    // 데이터베이스에 저장
	    dealRepo.save(entity);

	    redirectAttributes.addFlashAttribute("message", "게시물 등록 완료.");
	    return "redirect:/b_board";
	}

	// 중고거래 게시판 수정
	@RequestMapping("/modifyWrite")
	public String modifyWrite(@ModelAttribute DealEntity updatedEntity,@RequestParam("b_title") String title, @RequestParam("how_much") Long price,
			@RequestParam("category") String category, @RequestParam("b_content") String description,
			@RequestPart("files[]") MultipartFile[] files, HttpSession session, RedirectAttributes redirectAttributes, Long idx) {

		  String userId = (String) session.getAttribute("userId");
		    
		    // 파일이 비어 있는지 확인
		    if (files.length == 0 || files[0].isEmpty()) {
		        redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
		        return "redirect:/goWrite";
		    }
		    
		    // 파일 저장을 위한 StringBuilder를 사용해 파일 이름들을 연결할 수 있습니다.
		    StringBuilder filenames = new StringBuilder();
		    
		    for (MultipartFile file : files) {
		        if (!file.isEmpty()) {
		            String uuid = UUID.randomUUID().toString();
		            String filename = uuid + "_" + file.getOriginalFilename();
		            Path path = Paths.get(savePath + filename);

		            try {
		                // 파일 저장
		                Files.copy(file.getInputStream(), path);
		                // 파일 이름 추가
		                filenames.append(filename).append(";");
		            } catch (IOException e) {
		                e.printStackTrace();
		                redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
		                return "redirect:/goWrite";
		            }
		        }
		    }
		    System.out.println("파일 개수: " + files.length);
		    // DealEntity에 데이터 저장
		    DealEntity entity = new DealEntity();
		    entity.setB_title(title);
		    entity.setHow_much(price);
		    entity.setCategory(category);
		    entity.setB_content(description);
		    entity.setFilenames(filenames.toString()); // 모든 파일 이름들을 연결하여 저장
		    entity.setId(userId);

		    LocalDateTime now = LocalDateTime.now();
		    Timestamp timestamp = Timestamp.valueOf(now);
		    entity.setCreated_at(timestamp);

		    // 데이터베이스에 저장
		    dealRepo.save(entity);

		    redirectAttributes.addFlashAttribute("message", "게시물 등록 완료.");
		    return "redirect:/b_board";
	}
	
	// 중고거래게시판 디테일
	@RequestMapping("/goDetail")
	public String goDetail(Model model, HttpSession session, Long idx) {

	    // DealEntity와 UserEntity 가져오기
	    List<DealEntity> deal = dealRepo.findAll();
	    List<UserEntity> user = repo.findAll();

	    System.out.println("보여죵" + idx);

	    // 해당 게시물 찾기
	    for (int i = 0; i < deal.size(); i++) {
	        if (deal.get(i).getB_idx().equals(idx)) {
	            
	            // DealEntity를 모델에 추가
	            model.addAttribute("yoyo", deal.get(i));
	            
	            // UserEntity 찾기
	            for (int l = 0; l < user.size(); l++) {
	                if (deal.get(i).getId().equals(user.get(l).getId())) {

	                    model.addAttribute("user", user.get(l));
	                    model.addAttribute("duAddr", user.get(l).getAddr());

	                    // 사용자 파일 처리
	                    String duInfo = user.get(l).getUserFile();
	                    if (duInfo != null) {
	                        model.addAttribute("duInfo", duInfo);
	                    } else {
	                        duInfo = "free-icon-person-4203951.png";
	                        model.addAttribute("duInfo", duInfo);
	                    }

	                    // 게시물의 조회수 증가
	                    deal.get(i).setB_views(deal.get(i).getB_views() + 1);

	                    // 파일 이름을 분리하여 리스트로 변환
	                    String filenames = deal.get(i).getFilenames();
	                    if (filenames != null && !filenames.isEmpty()) {
	                        String[] fileArray = filenames.split(";");
	                        List<String> fileList = Arrays.asList(fileArray);
	                        model.addAttribute("fileList", fileList);
	                        model.addAttribute("file", fileList.get(0));
	                        System.out.println("파일이름 리스트로 나오나확인 "+ fileList.get(0));
	                    }
	                }
	            }
	          
	        }
	        
	    }
			for (int i = 0; i < deal.size(); i++) {
				if (deal.get(i).getB_idx().equals(idx)) {
					String userId = (String) session.getAttribute("userId");
					if(deal.get(i).getId().equals(userId)) {
						return "B_WriteDetail";
								
					}
				}
			}
			return "B_detail";
	        
	        
	    }

	   
	


	
	// 게시글 삭제
	@RequestMapping("/goDelete")
	public String goDelete(Long idx) {
		dealRepo.deleteById(idx);
		return "redirect:/b_board";
	}

	
	// 수정하기 위한 게시판으로 이동
	@RequestMapping("/dealModify")
	public String dealModify(Model model,String dealId, DealEntity entity, Long idx, HttpSession session) {
		
		Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
		System.out.println("안녕하세요"+ optionalEntity);
	    if (optionalEntity.isPresent()) {
	        entity = optionalEntity.get();
	     
	        model.addAttribute("deal", entity);
	       
	        model.addAttribute("file", "uploads/"+entity.getFilenames());

	    } 

		
		return "B_modify";
	}

	
	// 판매목록 확인페이지
	@RequestMapping("/deal")
	public String deal(HttpSession session,Model model) {
		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");
		
		List<DealEntity> entity = new ArrayList<>();
		List<DealEntity> list = dealRepo.findByIdx(loginInfo.getId());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getId().equals(loginInfo.getId())) {
				entity.add(list.get(i));
			}
		}
	System.out.println("엥"+entity);
		model.addAttribute("deal", entity);
		return "list";
	}
	
	// 판매목록 상태 변경 메서드
	@RequestMapping("/dealStatus")
	public String dealStatus(Model model,Long idx, @RequestParam("deal_status") String dealStatus) {
		
		Optional<DealEntity> list = dealRepo.findById(idx);
	


		if (list.isPresent()) {
			DealEntity entity = list.get();

		
			entity.setDeal_status(dealStatus);
			dealRepo.save(entity); // 변경 사항을 저장
		
		} else {
			System.out.println("해당 ID로 엔티티를 찾을 수 없습니다: " + idx);
			// 오류 처리 로직
		}
		
	
		
	
		return "redirect:/deal";
	}
	
	
	
	
	
	


}
