package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuguGallery {
	private int idx;
	private int u_idx;
	private String title;
	private String filename;
	private Timestamp gdate;
	private String gcontent;
	private int heart;
	private String category;
}
