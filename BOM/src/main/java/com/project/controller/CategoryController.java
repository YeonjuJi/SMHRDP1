package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.entity.DealEntity;
import com.project.repository.DealRepository;

@Controller
public class CategoryController {
	@Autowired
	private DealRepository dealRepo;
	
	// 남아의류
	@RequestMapping("/boyC")
	public String boyC(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryMOrderByBIdxDesc();
		model.addAttribute("deal", list);

		return "B_board";
	}
	
	// 여아의류
	@RequestMapping("/girlC")
	public String girlC(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryWOrderByBIdxDesc();
		model.addAttribute("deal", list);

		return "B_board";
	}
	
	// 장난감 
	@RequestMapping("/toy")
	public String toy(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryTOrderByBIdxDesc();
		model.addAttribute("deal", list);
		

		return "B_board";
	}
	
	// 도서교구
	@RequestMapping("/book")
	public String book(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryBOrderByBIdxDesc();
		model.addAttribute("deal", list);

		return "B_board";
	}
	
	// 아이가구
	@RequestMapping("/furniture")
	public String furniture(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryFOrderByBIdxDesc();
		model.addAttribute("deal", list);
		
		return "B_board";
	}
	
	// 육아출산
	@RequestMapping("/newBorn")
	public String newBorn(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryNOrderByBIdxDesc();
		model.addAttribute("deal", list);
		
		return "B_board";
	}
	
	// 유모차
	@RequestMapping("/babyCar")
	public String babyCar(Model model, DealEntity entity) {
		
		List<DealEntity> list = dealRepo.findByCategoryCOrderByBIdxDesc();
		model.addAttribute("deal", list);
		
		return "B_board";
	}
	
	
}
