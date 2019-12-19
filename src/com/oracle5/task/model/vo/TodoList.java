package com.oracle5.task.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class TodoList implements Serializable{
	private int todoNo;
	private String listCheck;
	private Date today;
	private String todayList;
	private String tomorrowList;
}
