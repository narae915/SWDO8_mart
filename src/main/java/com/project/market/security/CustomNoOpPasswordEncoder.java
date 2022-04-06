package com.project.market.security;

import org.springframework.security.crypto.password.PasswordEncoder;

// 비밀번호 인코더 커스튬 사용하지는 않았음
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		System.out.println("encode 전: " + rawPassword);
		return rawPassword.toString();
	}
	
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		System.out.println("matches 수행 :" + rawPassword + "::" + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
}
