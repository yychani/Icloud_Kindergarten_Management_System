package com.oracle5.member.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Ban implements Serializable{
	private int banNo;
	private String banName;
}
