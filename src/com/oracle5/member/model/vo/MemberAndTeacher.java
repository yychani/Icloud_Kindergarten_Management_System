package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class MemberAndTeacher implements Serializable{
	private String memberId;
	private String memberName;
	private String memberPwd;
	private String memberRno;
	private int memberNo;
	private String uType;
	private String email;
	private String phone;
	private Date leaveDate;
	private Date tEntDate;
	private String tDescription;
	private String imgSrc;
	private String className;
	private int pId; 
	private String pName;
	 
}
