package com.oracle5.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class CommonNote implements Serializable{
	private String note;
	private Date date;
	private int tNo;
}
