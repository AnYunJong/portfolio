package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuguUser {
	private int idx;
	private String name;
	private String email;
	private String password;
	private int birth;
	private String gender;
	private String phone_number;
	private String hobby;
	private String school;
	private String job;
	private String mbti;
	private String introduce;
	private String filename;
	private String short_intro;
	private String title;
}
