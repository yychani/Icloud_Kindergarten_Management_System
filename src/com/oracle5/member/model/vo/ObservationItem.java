package com.oracle5.member.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ObservationItem implements Serializable{
	private int obId;
	private int age;
	private String content;
}
