package com.oracle5.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Reply implements Serializable {
	private int rid;		//댓글번호
	private String rname;	//작성자
	private String rcont;	//내용
	private Date rdate;		//작성시간
	private int tid;		//글번호
	private String rstmt;	//확인여부
	private int refrid; 	//참조 댓글 번호
	
}
