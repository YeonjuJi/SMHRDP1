package com.project.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Convert;
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
@Table(name = "used_product_info")
public class DealEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long b_idx;
	
	private String category;

	private String b_title;

	private String id;

	private String b_content;

	private Integer b_views = 0;


	private String deal_status = "판매중";

	@Column(name = "b_file")
	private String filenames;

	private java.util.Date created_at;

	private Long how_much;


}
