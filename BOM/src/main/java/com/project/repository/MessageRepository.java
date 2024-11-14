package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.project.entity.DealEntity;
import com.project.entity.MessageEntity;

@Repository
public interface MessageRepository extends JpaRepository<MessageEntity, Long> {

	@Query("SELECT d FROM MessageEntity d ORDER BY d.send_at DESC")
	List<MessageEntity> findAllOrderBySendAtDesc();

	
}
