package com.project.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.entity.DealEntity;


@Repository
public interface DealRepository extends JpaRepository<DealEntity, Long> {
	
	
	
	
	
	
	/*
	 * List<DealEntity>
	 * findByB_viewsAndB_titleAndCreated_atAndHow_muchAndFiles(Integer b_views,
	 * String b_title, Date created_at, Long how_much,List<String> filenames);
	 */


	
	// spring boot에서는 sql문장을 지양한다!
	// JPA를 사용하여 자바언어로 구성된 sql 실행 메소드 사용!
	
	@Query("SELECT d FROM DealEntity d ORDER BY d.b_idx DESC")
	List<DealEntity> findAllOrderByBIdxDesc();
	
		
	@Query("SELECT d FROM DealEntity d WHERE d.category = '유모차매입' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryCarOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '남아의류' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryMOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '여아의류' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryWOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '장난감류' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryTOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '도서교구' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryBOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '아이가구' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryFOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '육아출산' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryNOrderByBIdxDesc();
	
	@Query("SELECT d FROM DealEntity d WHERE d.category = '유모차' ORDER BY d.b_idx DESC")
	List<DealEntity> findByCategoryCOrderByBIdxDesc();

	
	@Query("SELECT d FROM DealEntity d ORDER BY d.b_idx DESC")
	List<DealEntity> findByIdx(String id);
	

	

	

		
}
	
	
	

