package com.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.CommEntity;
import com.project.entity.DealEntity;

@Repository
public interface CommRepository extends JpaRepository<CommEntity, Integer> {

	// 모든 게시물을 오름차순으로 조회하는 메서드
	// @Query("SELECT cb FROM CommEntity cb ORDER BY cb.cb_idx ASC")
    List<CommEntity> findAll(Sort sort);
    
    // 페이징 처리를 위한 메서드
    Page<CommEntity> findAll(Pageable pageable);

    @Modifying
    @Query("UPDATE CommEntity cb SET cb.views = cb.views + 1 WHERE cb.id = :id")
    void incrementcount(@Param("id") String id);
	
}
