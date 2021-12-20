package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuguBoard {
	private int idx;
	private int u_idx;
	private String subject;
	private String content;
	private int heart;
	private Timestamp wdate;
	private int commentCount;
}
