package com.jcpdev.dto;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalProfile {
	private int idx;
	private String name;
	private String email;
	private int age;
	private String gender;
	private String hobby;
	private String school;
	private String job;
	private String mbti;
	private String introduce;
	private String filename;
	private int birth;
}


