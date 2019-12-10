package com.oracle5.member.model.vo;
import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class ReturnAgree implements java.io.Serializable{
	private int cId;
	private String cName;
	private int pNo;
	private Date applyDate;
	private String applyTime;
	private Date submitDate;
	private String status;
	private int raNo;
	private String guideName;
	private String guidePhone;

}
