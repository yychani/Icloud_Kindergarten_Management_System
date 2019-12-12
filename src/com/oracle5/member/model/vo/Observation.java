package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Observation implements Serializable {
	private int round;
	private int age;
	private int cid;
	private String eval;
	private int obId;
	private int tno;
	private String escore;
	private Date eDate;
}
