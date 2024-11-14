package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>{

	// findAll()
	// : select * from user_info;
	// findByID()
	// : select * from user_info where id=?;
	// save(?,?,?,?)
	// : insert into user_info values(?,?,?,?);
	// delete()
	// : delete from user_info where ?;
	
	// 사용자가 직접 구현하는 메소드 : Select 구문에서 주로 사용
	// find + 테이블명(생략가능) + By + 컬럼명1 + And/Or + 컬럼명2 + ...
	// 단, 해당하는 메소드의 이름을 지정할 때 꼭 카멜기법을 사용해야 한다.
	
	// Spring boot jpa 문법 검색하면 다양한 문법 찾을 수 있음!
	
	// 로그인 기능 메소드 생성
	public UserEntity findByIdAndPw(String id, String pw);
}
