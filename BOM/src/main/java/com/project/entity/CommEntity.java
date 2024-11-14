package com.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="community_info")
public class CommEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cb_idx") // DB의 컬럼명 명시적으로 매핑
	private Integer idx;
	
	private String cb_title;
	
	private String cb_content;
	
	private String cb_file;
	
	private java.sql.Timestamp created_at;
	
	@Column(columnDefinition = "int default 0", name = "cb_views")
	private Integer views = 0;
	
	private String id;
	
}
