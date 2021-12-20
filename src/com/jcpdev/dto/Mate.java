package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mate {
	private int u_idx;
	private int v_idx;
	private String state;
	private String nickName;
}
