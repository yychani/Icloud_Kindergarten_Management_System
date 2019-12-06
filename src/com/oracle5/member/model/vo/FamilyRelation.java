package com.oracle5.member.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class FamilyRelation implements Serializable{
	private String relation;
	private String name;
	private String phone;
	private int relationId;
}
