package com.project.entity;

import javax.persistence.Column;
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
@Table(name="COMMUNITY_COMMENT_INFO")
public class MentEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ccmt_idx") // DB의 컬럼명 명시적으로 매핑
	private Integer idx;
	
	@Column(name = "cb_idx") // DB의 컬럼명 명시적으로 매핑
	private Integer cbIdx;
	
	private String ccmt_content;
	private java.sql.Timestamp created_at;
	private Integer ccmt_likes;
	private String id;
	
	
}
