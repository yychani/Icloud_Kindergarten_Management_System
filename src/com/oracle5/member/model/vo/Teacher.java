package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Teacher implements Serializable{
	private int teacherNo;
	private Date tEntDate;
	private String tDescription;
	private String imgSrc;
	private String className;
	private int pId;  
}
