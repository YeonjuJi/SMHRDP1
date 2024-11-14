package com.project.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;
import com.project.entity.MessageEntity;
import com.project.entity.UserEntity;
import com.project.repository.DealRepository;
import com.project.repository.MessageRepository;
import com.project.repository.UserRepository;


@Controller
public class MessageController {

	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	@Autowired
	private MessageRepository meRepo;

	// 쪽지함 보여주는 메서드
	@RequestMapping("/messageList")
	private String messageList(Model model, HttpSession session) {
		// 메세지 테이블의 전체 데이터를 가져오기
		List<MessageEntity> list = meRepo.findAllOrderBySendAtDesc();
		String userId = (String) session.getAttribute("userId");

		// 받은 메세지 로직
		// 전체 데이터 중 조건에 맞는 데이터만 저장할 리스트 생성
		List<MessageEntity> selectMessage = new ArrayList<>();

		 // 수신한 메시지를 필터링하여 리스트에 추가
		for (MessageEntity message : list) {
	        if (message.getAccept_m().equals(userId)) {
	        	selectMessage.add(message);
	        }
	    }
	    
		// 로그 출력으로 데이터 확인
	    System.out.println("선택된 메시지 개수: " + selectMessage.size());
		
	    // 수신한 메시지 리스트를 모델에 추가
	    model.addAttribute("selectMessage", selectMessage);
	    
	    //========================================================
	    
	    //보낸 메세지 로직 추가
	    // 전체 데이터 중 조건에 맞는 데이터만 저장할 리스트 생성
 		List<MessageEntity> sendMessage = new ArrayList<>();
 		for (MessageEntity messageSend : list) {
	        if (messageSend.getSend_m().equals(userId)) {
	        	sendMessage.add(messageSend);
	        }
 		}
	    
 		// 로그 출력으로 데이터 확인
	    System.out.println("선택된 메시지 개수: " + sendMessage.size());
		
	    // 수신한 메시지 리스트를 모델에 추가
	    model.addAttribute("sendMessage", sendMessage);
		
		return "message";
	}

	// 보낸 메세지 디테일 메서드
	@RequestMapping("/sMessage")
	private String sendMessage(Model model, HttpSession session, Long idx) {
		List<MessageEntity> list = meRepo.findAllOrderBySendAtDesc();
		String userId = (String) session.getAttribute("userId");

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getM_idx().equals(idx)) {
				model.addAttribute("list", list.get(i));
			}
		}
		return "sendMessageDetail";
	}
	
	// 받은 메세지 디테일 메서드
	@RequestMapping("/rMessage")
	private String receiveMessage(Model model, HttpSession session, Long idx) {
		List<MessageEntity> list = meRepo.findAllOrderBySendAtDesc();
		String userId = (String) session.getAttribute("userId");
		System.out.println("Longidx"+idx);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getM_idx().equals(idx)) {
				model.addAttribute("list", list.get(i));
			}
		}
		return "receiveMessageDetail";
	}

	// 메세지 작성하러가는 메서드
	@RequestMapping("/smessage")
	private String smessage(HttpSession session, Model model, Long idx) {
		String userId = (String) session.getAttribute("userId");
		System.out.println("idx확인" + idx);
		if(userId == null) {
			return "redirect:/login";
		}
		model.addAttribute("id", userId);
		Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
	 
		if (optionalEntity.get().getB_idx().equals(idx)){
			model.addAttribute("sender", optionalEntity.get().getId());
		}
			
		return "messageWrite";
	}
	
	
	// 메세지 보내는 메서드
	@RequestMapping("/sendMessage")
	private String sendMessage(HttpSession session,
			@RequestParam("m_title") String title,
			@RequestParam("m_content") String content,
			@RequestParam("accept") String accept, // 받는사람
			Model model
			) {
		String userId = (String) session.getAttribute("userId");
		
		MessageEntity msEntity = new MessageEntity();
		msEntity.setM_content(content);
		msEntity.setSend_m(userId);
		msEntity.setM_title(title);
		msEntity.setAccept_m(accept);
		
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		msEntity.setSend_at(timestamp);

		meRepo.save(msEntity);
		System.out.println("잘나오는지 확인해보죠"+msEntity);
		return "redirect:/b_board";
		
	}
	
	// 답장 메서드
	@RequestMapping("/reSendMessage")
	private String reSendMessage(HttpSession session, Model model, Long idx) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("id", userId);
		
		Optional<MessageEntity> optionalEntity = meRepo.findById(idx);
	 
		if (optionalEntity.get().getM_idx().equals(idx)){
			model.addAttribute("sender", optionalEntity.get().getSend_m());
		}
			
		return "messageWrite";
	
	}
	
	// 삭제 메서드
	@RequestMapping("/deleteMessage")
	public String deleteMessage(Long idx) {
		meRepo.deleteById(idx);
		return "redirect:/messageList";
	}

	
	
	
	
	
}