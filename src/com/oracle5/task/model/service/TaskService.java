package com.oracle5.task.model.service;

import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.task.model.dao.TaskDao;
import com.oracle5.task.model.vo.FieldTripLearning;
import com.oracle5.task.model.vo.Meal;
import com.oracle5.task.model.vo.Participant;
import com.oracle5.task.model.vo.Position;
import com.oracle5.task.model.vo.Snack;
import com.oracle5.task.model.vo.TodoList;
import com.oracle5.task.model.vo.WorkDivision;
import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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

	public int fieldTripStart(FieldTripLearning ftl) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new TaskDao().ftlMenuVisible(con);
		
		int result2 = new TaskDao().insertFtl(con, ftl);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		return result;
	}

	public FieldTripLearning selectFieldTrip() {
		Connection con =  getConnection();
		
		FieldTripLearning ftl = new TaskDao().selectFieldTrip(con);
		
		close(con);
		return ftl;
	}

	public boolean checkMenuable() {
		Connection con = getConnection();
		
		boolean isPayment = new TaskDao().checkMenuable(con);
		
		close(con);
		return isPayment;
	}

	public int fieldTripEnd() {
		Connection con = getConnection();
		
		int result = new TaskDao().fieldTripEnd(con);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int currentChildCount() {
		Connection con = getConnection();
		
		int currentChildCount = new TaskDao().currentChildCount(con);
		
		close(con);
		return currentChildCount;
	}

	public int currentTeacherCount() {
		Connection con = getConnection();
		
		int currentTeacherCount = new TaskDao().currentTeacherCount(con);
		
		close(con);
		return currentTeacherCount;
	}

	public int minusYear(int currentYear) {
		Connection con = getConnection();
		
		int minusZeroYear = new TaskDao().minusYear(con, currentYear);
		
		close(con);
		return minusZeroYear;
	}

	public int YearsOld(int i) {
		Connection con = getConnection();
		
		int YearsOld = new TaskDao().YearsOld(con, i);
		
		close(con);
		return YearsOld;
	}

	public int[] YearsOldGender(int i) {
		Connection con = getConnection();
		
		int[] YearsOldGender = new TaskDao().YearsOldGender(con, i);
		
		close(con);
		return YearsOldGender;
	}

	
	/**
	 * @param year 년도
	 * @param month 월
	 * @param i 식사, 간식 구분
	 * @param string 식사중에 무엇인지 구분 
	 * @param weekOfMonth 주차
	 * @return
	 */
	public ArrayList<Meal> mealList(int year, int month, int i, String string, int weekOfMonth) {
		Connection con = getConnection();
		
		ArrayList<Meal> mealList = new TaskDao().mealList(con, year, month, i, string, weekOfMonth);
		
		close(con);
		return mealList;
	}

	public ArrayList<Snack> snackList(int year, int month, int i, String string, int weekOfMonth) {
		Connection con = getConnection();
		
		ArrayList<Snack> snackList = new TaskDao().snackList(con, year, month, i, string, weekOfMonth);
		
		close(con);
		return snackList;
	}

	public Meal selectOneMeal(int dietNo) {
		Connection con = getConnection();
		
		Meal meal = new TaskDao().selectOneMeal(con, dietNo);
		
		close(con);
		return meal;
	}

	public Snack selectOneSnack(int dietNo) {
		Connection con = getConnection();
		
		Snack snack = new TaskDao().selectOneSnack(con, dietNo);
		
		close(con);
		return snack;
	}
	
	/**
	 * @param hmap 간식과 식사가 들어있는 HashMap
	 * @return
	 */
	public int insertDiet(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		Snack snack = (Snack)hmap.get("Snack");
		Meal meal = (Meal)hmap.get("Meal");
		int result = 0;
		int result1 = 0;
		if(!snack.getSnack1().equals("")) {
			System.out.println("간식");
			int snackId = new TaskDao().selectSnack(con, snack);
			snack.setSnackId(snackId);
			if(snack.getSnack2().equals("")) {
				snack.setSnack2(" ");
			}
			
			if(snackId == 0) {
				System.out.println("일치하는 스낵x 새 스낵 insert");
				result1 = new TaskDao().insertSnack(con, snack);
			}else {
				System.out.println("일치하는 스낵o");
				result1 = 1;
			}
			if(result1 > 0) {
				snackId = new TaskDao().selectSnack(con, snack);
			}else {
			}
			snack.setSnackId(snackId);
		}else {
			System.out.println("식사");
			int mealNo = new TaskDao().selectMeal(con, meal);
			meal.setMealNo(mealNo);
			
			if(mealNo == 0) {
				System.out.println("일치하는 식사x 새 식사 insert");
				result1 = new TaskDao().insertMeal(con, meal);
			}else {
				System.out.println("일치하는 식사o");
				result1 = 1;
			}
			if(result1 > 0) {
				mealNo = new TaskDao().selectMeal(con, meal);
			}else {
			}
			
			meal.setMealNo(mealNo);
		}
		
		boolean isExist = new TaskDao().selectDietTable(con, snack.getDietNo());
		
		if(isExist == false) {
			result = new TaskDao().insertDietTable(con, snack, meal);
			
			if(result > 0 && result1 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			
			result = new TaskDao().updateDietTable(con, snack, meal);
			
			if(result > 0 && result1 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		return result;
	}

	public ArrayList<Participant> selectParticipant() {
		Connection con = getConnection();
		
		ArrayList<Participant> participantList = new TaskDao().selectParticipant(con);
		
		close(con);
		return participantList;
	}

	public int updateFtlList(String[] partNo) {
		Connection con = getConnection();
		
		int result = 0;
		for(int i = 0; i < partNo.length; i++) {
			result += new TaskDao().updateFtlList(con, Integer.parseInt(partNo[i]));
		}
		
		if(result == partNo.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result; 
	}

	public ArrayList<Participant> selectPrevPartList() {
		Connection con = getConnection();
		
		ArrayList<Participant> prevPartList = new TaskDao().selectPrevPartList(con);
		
		close(con);
		return prevPartList;
	}

	public int insertTodoList(ArrayList<TodoList> todoList) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(int i = 0; i < todoList.size(); i++) {
			result += new TaskDao().insertTodoList(con, todoList.get(i), i);
		}
		if(result > todoList.size() - 1) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public ArrayList<TodoList> selectTodoList() {
		Connection con = getConnection();
		
		ArrayList<TodoList> todoList = new TaskDao().selectTodoList(con);
		
		close(con);
		return todoList;
	}
}
