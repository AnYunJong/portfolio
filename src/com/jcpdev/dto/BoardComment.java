package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	private int idx;
	private int u_idx;
	private int board_idx;
	private String name;
	private String content;
	private Timestamp wdate;
}
