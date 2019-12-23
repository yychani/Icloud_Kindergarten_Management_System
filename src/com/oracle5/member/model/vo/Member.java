package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;


@Data
public class Member implements Serializable{
	private String memberId;
	private String memberName;
	private String memberPwd;
	private String memberRno;
	private int memberNo;
	private String uType;
	private String email;
	private String phone;
	private Date leaveDate;
	private String hq;
} 
 

