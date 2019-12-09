package com.oracle5.member.model.vo;
import java.io.Serializable;
import java.sql.Date;

import lombok.Data;
 
@Data
public class DoseRequest implements java.io.Serializable{
	private int cNo;
	private String symptom;
	private String kinds;
	private String keep;
	private Date startDate;
	private String remarks;
	private Date submitDate;
	private int pNo;
	private Date endDate;
	private String status;
	private int dNo;
	private String dosingTime;
}
