package com.oracle5.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Attachment implements Serializable{
	private int fid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String status; 
	private int type;
	private int cId;
	private int feedNo;
	private int tId;
}
