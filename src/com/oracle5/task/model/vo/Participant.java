package com.oracle5.task.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Participant implements Serializable{
	private int rnum;
	private int participantNo;
	private int ftlId;
	private String payment;
	private int cid;
	private String cNname;
	private String attend;
	private String pName;
	private String field;
	private Date applyDate;
	private Date acceptDate;
}
