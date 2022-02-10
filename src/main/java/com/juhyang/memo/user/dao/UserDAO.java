package com.juhyang.memo.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.memo.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(
			@Param("loginId")String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email")String email);



public User selectUser(@Param("loginId")String loginId,
		@Param("password") String password);



public boolean IsDuplicateID(@Param("loginId")String loginId);



public Boolean IsDuplicateEmail(@Param("email")String email);

}