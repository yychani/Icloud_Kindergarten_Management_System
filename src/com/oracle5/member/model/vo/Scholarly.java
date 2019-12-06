package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Scholarly implements Serializable{
	private Date sDate;
	private String agency;
	private String uniqueness;
}
