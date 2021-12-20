package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuestBook {
	private int idx;
	private int v_idx;
	private int u_idx;
	private String content;
	private String name;
	private Timestamp wdate;
}
