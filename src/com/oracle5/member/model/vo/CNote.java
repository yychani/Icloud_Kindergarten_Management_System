package com.oracle5.member.model.vo;
import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class CNote  implements Serializable {
	private String note;
	private Date date;
	private int tNo;

}
