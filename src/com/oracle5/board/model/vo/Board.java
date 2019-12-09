package com.oracle5.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
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
}
