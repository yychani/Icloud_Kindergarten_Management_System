package com.oracle5.task.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Meal implements Serializable{
	private String rice;
	private String soup;
	private String side1;
	private String side2;
	private String side3;
	private int mealNo;
	private int day;
	private int dietNo;
	private int type = 1;
}
