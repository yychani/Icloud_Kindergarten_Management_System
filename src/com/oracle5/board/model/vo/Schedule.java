package com.oracle5.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Schedule implements Serializable{
	private Date date;
	private String content;
}
