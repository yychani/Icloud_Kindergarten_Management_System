package com.oracle5.member.model.vo;
import java.io.Serializable;
import lombok.Data;

@Data
public class Participation implements java.io.Serializable{
	private int pNo;
	private int ptlId;
	private String payment;
	private int cId;
	private String attend;
}
