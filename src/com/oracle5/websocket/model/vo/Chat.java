package com.oracle5.websocket.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Chat implements Serializable{
	private int ctype;
	private Date date;
	private String time;
	private String cont;
	private int mno;
	private int chatNo;
	private String viewCheck;
}
