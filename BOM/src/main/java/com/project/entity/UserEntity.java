package com.project.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // Table을 표현하는 자료형
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="user_info")
public class UserEntity {
    @Id
    private String id;
    
    
    private String pw;
    private String name;
    private String phone;
    private String prinfo;
    private String addr;
    private Integer score;
    private java.sql.Timestamp joined_at;
    private Double latitude;  // 위도
    private Double longitude; // 경도
    
    @Column(name = "user_pp")
	private String userFile;
    
}

