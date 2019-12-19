package com.oracle5.websocket.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class FeedVo implements Serializable{
	private int feedNo;
	private int cid;
	private Date fdate;
	private String time;
	private String content;
	private String changeName;
}
