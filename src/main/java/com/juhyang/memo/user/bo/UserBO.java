package com.juhyang.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.memo.common.EncryptUtils;
import com.juhyang.memo.user.dao.UserDAO;
import com.juhyang.memo.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	public int AddUser(String loginId,
						String password,
						String name,
						String email) {
		//암호화
		
		String encPassword = EncryptUtils.md5(password);

		return userDAO.insertUser(loginId, encPassword, name, email);

	}
	
	public User getUser(
			String loginId,
			String password
			) {
		String encPw = EncryptUtils.md5(password);
		return userDAO.selectUser(loginId, encPw);
	}

	public boolean CountUser(String loginId) {
		return userDAO.IsDuplicateID(loginId);
	}

	public Boolean CountEmail(String email) {
		return userDAO.IsDuplicateEmail(email);
	}
}
