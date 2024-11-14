package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.entity.CommEntity;
import com.project.entity.MentEntity;

@Repository
public interface MentRepository extends JpaRepository<MentEntity, Integer> {

	// 게시글의 cbIdx를 기준으로 댓글 리스트 가져오기
	List<MentEntity> findByCbIdx(Integer cbIdx);
	
}
