package com.oracle5.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Attachment implements Serializable{
	private int fid;
	private int bid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private int downloadCount;
	private String status; 
}
