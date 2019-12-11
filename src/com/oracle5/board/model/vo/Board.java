package com.oracle5.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Board implements Serializable{
	private int tid;
	private String ttitle;
	private String tcont;
	private int twriter;
	private int tcount;
	private Date ttime;
	private int tno;
	private int pno;
	private int bdid;
	private String tstmt;
	private String name;
}
