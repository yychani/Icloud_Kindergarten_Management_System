package com.oracle5.member.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Children implements Serializable{
	private int cId;
	private String originAddr;
	private String bloodType;
	private String emergency;
	private String description;
	private String imgSrc;
	private String name;
	private String rno; 
	private int pno;
	private int bcNo;
}
