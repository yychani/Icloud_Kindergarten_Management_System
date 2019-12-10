package com.oracle5.task.model.service;

import com.oracle5.task.model.dao.TaskDao;
import com.oracle5.task.model.vo.Position;
import com.oracle5.task.model.vo.WorkDivision;
import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class TaskService {

	public int insertUBusiness(WorkDivision work) {
		Connection con = getConnection();
		
		int result = new TaskDao().insertUBusiness(con, work);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<WorkDivision> selectWorkList() {
		Connection con = getConnection();
		
		ArrayList<WorkDivision> list = new TaskDao().selectWorkList(con);
		
		close(con);
		return list;
	}

	public ArrayList<Position> selectPosition() {
		Connection con = getConnection();
		
		ArrayList<Position> list = new TaskDao().selectPosition(con);
		
		close(con);
		return list;
	}

	public int insertDBusiness(WorkDivision work) {
		Connection con = getConnection();
		
		int result = new TaskDao().insertDBusiness(con, work);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public WorkDivision selectWork(WorkDivision work) {
		Connection con = getConnection();
		
		WorkDivision resultWork = new TaskDao().selectWork(con, work);
		
		close(con);
		return resultWork;
	}

	public int updateWork(WorkDivision work) {
		Connection con = getConnection();
		
		int result = new TaskDao().updateWork(con, work);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public boolean checkDDuplicate(int chargeN) {
		Connection con = getConnection();
		
		boolean isExist = new TaskDao().checkDDuplicate(con, chargeN);
		close(con);
		return isExist;
	}

	public boolean checkUDuplicate(int chargeN) {
		Connection con = getConnection();
		
		boolean isExist = new TaskDao().checkUDuplicate(con, chargeN);
		close(con);
		return isExist;
	}

	public int deleteWork(WorkDivision work) {
		Connection con = getConnection();
		
		int result = new TaskDao().deleteWork(con, work);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

}
