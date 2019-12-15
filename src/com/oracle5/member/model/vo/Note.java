package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Note implements Serializable {
	private int cid;
	private String unique;
	private String materials;
	private String health;
	private Date nDate;
	private int tno;
}
