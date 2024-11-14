package com.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;
import com.project.entity.UserEntity;
import com.project.repository.CarRepository;
import com.project.repository.DealRepository;
import com.project.repository.UserRepository;

@Controller
public class CarController {

	@Value("${file.upload-dir.stroller}")
	private String savePath;


	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	@Autowired
	private CarRepository carRepo;

	// stroller를 눌렀을 때 로그인/관리자/일반유저에 따라 페이지 이동
	@RequestMapping("/car")
	public String car(HttpSession session) {

		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return "login";
		}

		if (userId.equals("test")) {
			return "redirect:/pathAdmin";
		} else {
			return "redirect:/gogo";
		}
	}
	
	// 로그인한 관리자가 stroller를 눌렀을 때 이동
	@RequestMapping("/pathAdmin")
	public String pathAdmin(Model model) {
		List<CarEntity> entity = carRepo.findAllDesc();

		System.out.println("나에게 엔티티를 보여줘" + entity);
		model.addAttribute("deal", entity);

		return "admin";
	}
	
	// stroller를 눌렀을 때 로그인한 일반 유저의 이동
	@RequestMapping("/gogo")
	private String gogo(HttpSession session) {
		return "redirect:/goCarWrite";
	}
	
	// 유모차 판매글 작성 페이지
	@RequestMapping("/goCarWrite")
	private String goCarWrite(HttpSession session, Model model) {
		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");
		if (!loginInfo.getId().equals("test")) {
			model.addAttribute("id", loginInfo.getId());
			return "strollerWrite";
		} else if (loginInfo.getId().equals("test")) {
			return "admin";
		} else{
			return "redirect:/doLogin";
		}
	}
	
	// 유모차 거래게시판으로 이동 
	@RequestMapping("goCar")
	private String goCar(Model model, HttpSession session) {
		List<CarEntity> entity = carRepo.findAllByCarCoursDesc();
		model.addAttribute("stList", entity);
		return "stroller";
	}
	
	// 유저가 관리에게 유모차를 판매하는 글을 처리하는 로직
	@Transactional
	@RequestMapping("/carWrite")
	private String carWrite(@RequestParam("b_title") String title, @RequestParam("how_much") Long price,
			@RequestParam("category") String category, @RequestParam("b_content") String content,
			@RequestParam("file") MultipartFile file, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {

		String userId = (String) session.getAttribute("userId");
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
			return "redirect:/goCarWrite";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try (InputStream inputStream = file.getInputStream()) {
			Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);

		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
			return "redirect:/goCarWrite";
		}

		CarEntity carEntity = new CarEntity();
		carEntity.setCar_content(content);
		carEntity.setCar_cours("신청");
		carEntity.setCar_file(filename);
		carEntity.setCar_price(price);
		carEntity.setCar_title(title);
		carEntity.setId(userId);

		System.out.println("보여줘 너의 엔티티를 " + carEntity);

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		carEntity.setCard_at(timestamp);

		carRepo.save(carEntity);

		return "index";
	}
	
	// 유모차 판매페이지(로그인안했으면 로그인페이지로이동, 유모차를 판매하는 관리자가 보려고 하는 경우 유모차 판매페이지로 이동)
	@RequestMapping("goCarDetail")
	public String carDetail(Long idx, Model model, HttpSession session) {
		
		Optional<CarEntity> car = carRepo.findById(idx);
		Optional<UserEntity> user = repo.findById(car.get().getId());
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null) {
			return "redirect:/login";
		}
		model.addAttribute("car", car.get());
		model.addAttribute("user", user.get().getUserFile());
		
		if (userId.equals("test")) {
			return "CarDetailAdmin";
		}
		return "CarDetail";
	}

	// 매입요청들어온 유모차를 확인하고 관리하는 페이지
	@RequestMapping("/carAdmin")
	public String carAdmin(Model model, String dealId, CarEntity entity, Long idx) {
		Optional<CarEntity> optionalEntity = carRepo.findById(idx);
		List<CarEntity> car = carRepo.findAll();
		List<UserEntity> user = repo.findAll();

		if (optionalEntity.isPresent()) {
			entity = optionalEntity.get();

			model.addAttribute("deal", entity);

			model.addAttribute("file", "stroller/"+entity.getCar_file());
		}

		return "CarAdminMode";
	}

	// 관리자가 보수가 완료된 유모차의 판매글을 올리는 로직
	@RequestMapping("/adminWrite")
	public String adminWrite(@ModelAttribute CarEntity updatedEntity, @RequestParam("car_title") String title,
			@RequestParam("car_price") Long price, @RequestParam("car_rank") String rank,
			@RequestParam("car_content") String description, @RequestParam("file") MultipartFile file,
			@RequestParam("car_cours") String cours, HttpSession session, RedirectAttributes redirectAttributes,
			Long idx) {

		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try {
			Files.copy(file.getInputStream(), path);
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
			return "redirect:/goWrite";
		}
		
		Optional<CarEntity> optionalEntity = carRepo.findById(idx);
		CarEntity entity = optionalEntity.get();
		entity.setCar_title(title);
		entity.setCar_price(price);
		entity.setId("test");
		entity.setCar_rank(rank);
		entity.setCar_cours(cours);
		entity.setCar_content(description);
		entity.setCar_file(filename);

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		entity.setCard_at(timestamp);

		carRepo.save(entity);

		redirectAttributes.addFlashAttribute("message", "게시물 등록 완료.");
		return "redirect:/goCar";
	}

		// 구매하기 팝업을 위한 로직
	   @GetMapping("/showPopUp")
	    public String showPopup(Long idx, Model model, HttpSession session) {
		  Optional<CarEntity> list = carRepo.findById(idx);
		  
		   model.addAttribute("consumer", session.getId());
		   model.addAttribute("list", list.get());
		   
	        return "popUp"; 
	    }
	   
	   // 관리자의 보수 진행정도를 간단하게 변경할 수 있게 한 로직
		@RequestMapping("/updateStatus")
		public String updateStatus(@RequestParam("car_idx") Long car_idx, @RequestParam("car_cours") String car_cours) {

			Optional<CarEntity> optionalEntity = carRepo.findById(car_idx);

			if (optionalEntity.isPresent()) {
				CarEntity entity = optionalEntity.get();

				// 사용자가 선택한 car_cours 값을 설정
				entity.setCar_cours(car_cours);
				carRepo.save(entity); // 변경 사항을 저장	
			} 
			return "redirect:/pathAdmin";
		}
}
