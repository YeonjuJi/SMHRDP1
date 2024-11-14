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
@Table(name="baby_car_info")
public class CarEntity {
	
	//글식별자
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long car_idx;
	
	// 글내용
	private String car_content;
	
	// 글 사진
	private String car_file;
	
	// 글 생성일자
	private java.util.Date card_at;
	
	
	// 작성자 id
	private String id;
	
	 
	// 수리진행척도
	private String car_cours;
	
	// 글 제목
	private String car_title;
	
	// 유모차 상태
	private String car_rank = "A";
	
	// 유모차 가격
	private Long car_price;

}


