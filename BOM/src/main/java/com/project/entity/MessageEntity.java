package com.project.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "message_info")
public class MessageEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long m_idx;  // 쪽지 식별자
	
	private String send_m; // 작성자
	private String accept_m; // 수신자
	private String m_title; // 쪽지제목
	private String m_content; // 쪽지내용
	private java.util.Date send_at; // 보낸일자
	
}
