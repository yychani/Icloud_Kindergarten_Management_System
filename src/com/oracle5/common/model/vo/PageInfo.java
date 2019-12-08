package com.oracle5.common.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageInfo implements Serializable{
	private int currentPage;
	private int listCount;
	private int limit; 
	private int maxPage; 
	private int startPage; 
	private int endPage;
}
