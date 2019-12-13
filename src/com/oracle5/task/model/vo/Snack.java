package com.oracle5.task.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Snack implements Serializable {
	private int snackId;
	private String snack1;
	private String snack2;
	private int day;
	private int dietNo;
	private int type = 2;
	private String typeName;
	private String date;
	private int weekOfMonth;
}
