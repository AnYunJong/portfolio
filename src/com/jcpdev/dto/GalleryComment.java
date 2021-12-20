package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GalleryComment {
	private int idx;
	private int u_idx;
	private int gallery_idx;
	private String name;
	private String content;
	private String wdate;
}
