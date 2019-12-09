package com.oracle5.task.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class WorkDivision implements Serializable{
	private int type;
	private String content;
	private String area;
	private int pid;
	private int tno;
	private String name;
}
