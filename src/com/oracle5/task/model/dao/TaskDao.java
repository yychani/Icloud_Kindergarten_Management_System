package com.oracle5.task.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.oracle5.task.model.vo.FieldTripLearning;
import com.oracle5.task.model.vo.Meal;
import com.oracle5.task.model.vo.Participant;
import com.oracle5.task.model.vo.Position;
import com.oracle5.task.model.vo.Snack;
import com.oracle5.task.model.vo.WorkDivision;

import static com.oracle5.common.JDBCTemplate.*;

public class TaskDao {
	Properties prop = new Properties();

	public TaskDao() {
		String fileName = TaskDao.class.getResource("/sql/task/task-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertUBusiness(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertUBusiness");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			pstmt.setInt(3, work.getTno());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<WorkDivision> selectWorkList(Connection con) {
		ArrayList<WorkDivision> list = null;
		ResultSet rset = null;
		Statement stmt = null;

		String query = prop.getProperty("selectWorkList");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					WorkDivision work = new WorkDivision();
					work.setType(rset.getInt("TYPE"));
					if (rset.getInt("TYPE") == 1) {
						work.setPid(rset.getInt("PID"));
						work.setName(rset.getString("PNAME"));
					} else {
						work.setTno(rset.getInt("M_NO"));
						work.setName(rset.getString("NAME"));
					}
					work.setArea(rset.getString("AREA"));
					work.setContent(rset.getString("CONTENT"));

					list.add(work);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<Position> selectPosition(Connection con) {
		ArrayList<Position> list = null;
		ResultSet rset = null;
		Statement stmt = null;

		String query = prop.getProperty("selectPosition");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					Position p = new Position();

					p.setPid(rset.getInt("PID"));
					p.setPname(rset.getString("PNAME"));

					list.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public int insertDBusiness(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertDBusiness");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			pstmt.setInt(3, work.getPid());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public WorkDivision selectWork(Connection con, WorkDivision work) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		WorkDivision resultWork = null;
		String query = "";
		if (work.getPid() != 0) {
			query = prop.getProperty("selectWorkPid");
		} else if (work.getTno() != 0) {
			query = prop.getProperty("selectWorkTno");
		}

		try {
			pstmt = con.prepareStatement(query);
			if (work.getPid() != 0) {
				pstmt.setInt(1, work.getPid());
			} else if (work.getTno() != 0) {
				pstmt.setInt(1, work.getTno());
			}

			rset = pstmt.executeQuery();

			if (rset.next()) {
				resultWork = new WorkDivision();
				resultWork.setType(rset.getInt("TYPE"));
				if (rset.getInt("TYPE") == 1) {
					resultWork.setPid(rset.getInt("PID"));
					resultWork.setName(rset.getString("PNAME"));
				} else {
					resultWork.setTno(rset.getInt("M_NO"));
					resultWork.setName(rset.getString("NAME"));
				}
				resultWork.setArea(rset.getString("AREA"));
				resultWork.setContent(rset.getString("CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return resultWork;
	}

	public int updateWork(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		if (work.getPid() != 0) {
			query = prop.getProperty("updateWorkPid");
		} else if (work.getTno() != 0) {
			query = prop.getProperty("updateWorkTno");
		}
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			if (work.getPid() != 0) {
				pstmt.setInt(3, work.getPid());
			} else if (work.getTno() != 0) {
				pstmt.setInt(3, work.getTno());
			}

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public boolean checkDDuplicate(Connection con, int chargeN) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isExist = false;

		String query = prop.getProperty("checkDDuplicate");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chargeN);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return isExist;
	}

	public boolean checkUDuplicate(Connection con, int chargeN) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isExist = false;

		String query = prop.getProperty("checkUDuplicate");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chargeN);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return isExist;
	}

	public int deleteWork(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		if (work.getPid() != 0) {
			query = prop.getProperty("deleteWorkPid");
		} else if (work.getTno() != 0) {
			query = prop.getProperty("deleteWorkTno");
		}
		try {
			pstmt = con.prepareStatement(query);
			if (work.getPid() != 0) {
				pstmt.setInt(1, work.getPid());
			} else if (work.getTno() != 0) {
				pstmt.setInt(1, work.getTno());
			}

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int ftlMenuVisible(Connection con) {
		Statement stmt = null;
		int result = 0;

		String query = prop.getProperty("ftlMenuVisible");

		try {
			stmt = con.createStatement();

			result = stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}

		return result;
	}

	public int insertFtl(Connection con, FieldTripLearning ftl) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFtl");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, ftl.getFtlDate());
			pstmt.setString(2, ftl.getField());
			pstmt.setInt(3, ftl.getFtlPay());
			pstmt.setString(4, ftl.getMaterials());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public FieldTripLearning selectFieldTrip(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		FieldTripLearning ftl = null;
		String query = prop.getProperty("selectFieldTrip");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				ftl = new FieldTripLearning();

				ftl.setFtlId(rset.getInt("FTL_ID"));
				ftl.setField(rset.getString("FIELD"));
				ftl.setFtlDate(rset.getDate("FTL_DATE"));
				ftl.setFtlPay(rset.getInt("FTL_PAY"));
				ftl.setMaterials(rset.getString("METERIALS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return ftl;
	}

	public boolean checkMenuable(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		boolean isPayment = false;
		String query = prop.getProperty("checkMenuable");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				isPayment = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return isPayment;
	}

	public int fieldTripEnd(Connection con) {
		Statement stmt = null;
		int result = 0;

		String query = prop.getProperty("ftlMenuInvisible");

		try {
			stmt = con.createStatement();

			result = stmt.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}

		return result;
	}

	public int currentChildCount(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		int currentChildCount = 0;

		String query = prop.getProperty("currentChildCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				currentChildCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return currentChildCount;
	}

	public int currentTeacherCount(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		int currentTeacherCount = 0;

		String query = prop.getProperty("currentTeacherCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				currentTeacherCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return currentTeacherCount;
	}

	public int minusYear(Connection con, int currentYear) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int minusYear = 0;

		String query = prop.getProperty("minusYear");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currentYear);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				minusYear = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return minusYear;
	}

	public int YearsOld(Connection con, int i) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int YearsOld = 0;

		String query = prop.getProperty("YearsOld");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				YearsOld = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return YearsOld;
	}

	public int[] YearsOldGender(Connection con, int i) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int[] YearsOldGender = null;

		String query = prop.getProperty("YearsOldGender");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);

			rset = pstmt.executeQuery();

			if (rset != null) {
				YearsOldGender = new int[2];
				int index = 0;
				while (rset.next()) {
					YearsOldGender[index] = rset.getInt(1);
					index++;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return YearsOldGender;
	}

	/**
	 * @param con
	 * @param year
	 * @param month
	 * @param i
	 *            타입
	 * @param string
	 *            식사 타입
	 * @param weekOfMonth
	 * @return
	 */
	public ArrayList<Meal> mealList(Connection con, int year, int month, int i, String string, int weekOfMonth) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Meal> mealList = null;

		String query = prop.getProperty("mealList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			if (month == 12) {
				pstmt.setInt(3, year + 1);
				pstmt.setInt(4, 1);
			} else {
				pstmt.setInt(3, year);
				pstmt.setInt(4, month + 1);
			}
			pstmt.setInt(5, i);
			pstmt.setString(6, string);
			pstmt.setInt(7, weekOfMonth);

			rset = pstmt.executeQuery();

			if (rset != null) {
				mealList = new ArrayList<>();
				for (int j = 0; j < 6; j++) {
					mealList.add(new Meal());
				}
				while (rset.next()) {
					Meal meal = new Meal();
					
					meal.setMealNo(rset.getInt("MEAL_NO"));
					meal.setRice(rset.getString("RICE"));
					meal.setSoup(rset.getString("SOUP"));
					meal.setSide1(rset.getString("SIDE1"));
					meal.setSide2(rset.getString("SIDE2"));
					meal.setSide3(rset.getString("SIDE3"));
					meal.setDay(rset.getInt("DAY"));
					meal.setDietNo(rset.getInt("DIET_NO"));
					
					mealList.add(meal.getDay() - 2, meal);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return mealList;
	}

	public ArrayList<Snack> snackList(Connection con, int year, int month, int i, String string, int weekOfMonth) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Snack> snackList = null;

		String query = prop.getProperty("snackList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			if (month == 12) {
				pstmt.setInt(3, year + 1);
				pstmt.setInt(4, 1);
			} else {
				pstmt.setInt(3, year);
				pstmt.setInt(4, month + 1);
			}
			pstmt.setInt(5, i);
			pstmt.setString(6, string);
			pstmt.setInt(7, weekOfMonth);

			rset = pstmt.executeQuery();

			if (rset != null) {
				snackList = new ArrayList<>();
				for (int j = 0; j < 6; j++) {
					snackList.add(new Snack());
				}
				while (rset.next()) {
					Snack snack = new Snack();
					snack.setDietNo(rset.getInt("DIET_NO"));
					snack.setDay(rset.getInt("DAY"));
					snack.setSnackId(rset.getInt("SNACK_ID"));
					snack.setSnack1(rset.getString("SNACK_NAME"));
					snack.setSnack2(rset.getString("SNACK_NAME2"));
					snackList.add(snack.getDay() - 2, snack);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return snackList;
	}

	public Meal selectOneMeal(Connection con, int dietNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Meal meal = null;
		
		String query = prop.getProperty("selectOneMeal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dietNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				meal = new Meal();
				meal.setMealNo(rset.getInt("MEAL_NO"));
				meal.setType(rset.getInt("TYPE"));
				meal.setRice(rset.getString("RICE"));
				meal.setSoup(rset.getString("SOUP"));
				meal.setSide1(rset.getString("SIDE1"));
				meal.setSide2(rset.getString("SIDE2"));
				meal.setSide3(rset.getString("SIDE3"));
				meal.setDietNo(rset.getInt("DIET_NO"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

	return meal;
}

	public Snack selectOneSnack(Connection con, int dietNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Snack snack = null;

		String query = prop.getProperty("selectOneSnack");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dietNo);
		
			rset = pstmt.executeQuery();

			if (rset.next()) {
				snack = new Snack();
				snack.setDietNo(rset.getInt("DIET_NO"));
				snack.setType(rset.getInt("TYPE"));
				snack.setSnackId(rset.getInt("SNACK_ID"));
				snack.setSnack1(rset.getString("SNACK_NAME"));
				snack.setSnack2(rset.getString("SNACK_NAME2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return snack;
	}

	public int selectSnack(Connection con, Snack snack) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int snackNo = 0;
		String query = prop.getProperty("selectSnackExist");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, snack.getSnack1());
			pstmt.setString(2, snack.getSnack2());
		
			rset = pstmt.executeQuery();

			if (rset.next()) {
				snackNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return snackNo;
	}

	public int insertSnack(Connection con, Snack snack) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertSnack");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, snack.getSnack1());
			
			pstmt.setString(2, snack.getSnack2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertDietTable(Connection con, Snack snack, Meal meal) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "";
		if(!snack.getSnack1().equals("")) {
			query = prop.getProperty("insertDietSnack");
		}else {
			query = prop.getProperty("insertDietMeal");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, Date.valueOf(meal.getDate()));
			if(!snack.getSnack1().equals("")) {
				pstmt.setInt(2, snack.getSnackId());
				pstmt.setString(3, snack.getTypeName());
			}else {
				pstmt.setInt(2, meal.getMealNo());
				pstmt.setString(3, meal.getTypeName());
			}
			pstmt.setInt(4, meal.getWeekOfMonth());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectMeal(Connection con, Meal meal) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int mealNo = 0;
		String query = prop.getProperty("selectMealExist");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, meal.getRice());
			pstmt.setString(2, meal.getSoup());
			pstmt.setString(3, meal.getSide1());
			pstmt.setString(4, meal.getSide2());
			pstmt.setString(5, meal.getSide3());
		
			rset = pstmt.executeQuery();

			if (rset.next()) {
				mealNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return mealNo;
	}

	public int insertMeal(Connection con, Meal meal) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertMeal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, meal.getRice());
			pstmt.setString(2, meal.getSoup());
			pstmt.setString(3, meal.getSide1());
			pstmt.setString(4, meal.getSide2());
			pstmt.setString(5, meal.getSide3());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public boolean selectDietTable(Connection con, int dietNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		boolean isExist = false;
		String query = prop.getProperty("selectDietTable");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dietNo);
		
			rset = pstmt.executeQuery();

			if (rset.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return isExist;
	}

	public int updateDietTable(Connection con, Snack snack, Meal meal) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "";
		if(!snack.getSnack1().equals("")) {
			query = prop.getProperty("updateDietSnack");
		}else {
			query = prop.getProperty("updateDietMeal");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(!snack.getSnack1().equals("")) {
				pstmt.setInt(1, snack.getSnackId());
			}else {
				pstmt.setInt(1, meal.getMealNo());
			}
			pstmt.setInt(2, meal.getDietNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Participant> selectParticipant(Connection con) {
		ArrayList<Participant> participantList = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		String query = prop.getProperty("selectParticipant");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				participantList = new ArrayList<>();
				while(rset.next()) {
					Participant p = new Participant();
					p.setRnum(rset.getInt("RNUM"));
					p.setParticipantNo(rset.getInt("PARTICIPANT_NO"));
					p.setFtlId(rset.getInt("FTL_ID"));
					p.setPayment(rset.getString("PAYMENT"));
					p.setCid(rset.getInt("C_ID"));
					p.setCNname(rset.getString("C_NAME"));
					p.setAttend(rset.getString("ATTEND"));
					p.setPName(rset.getString("NAME"));
					p.setApplyDate(rset.getDate("APPLY_DATE"));
					
					participantList.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return participantList;
	}

	public int updateFtlList(Connection con, int partNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateFtlList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, partNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Participant> selectPrevPartList(Connection con) {
		ArrayList<Participant> prevPartList = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		String query = prop.getProperty("selectPrevPartList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				prevPartList = new ArrayList<>();
				while(rset.next()) {
					Participant p = new Participant();
					p.setRnum(rset.getInt("RNUM"));
					p.setParticipantNo(rset.getInt("PARTICIPANT_NO"));
					p.setFtlId(rset.getInt("FTL_ID"));
					p.setField(rset.getString("FIELD"));
					p.setPayment(rset.getString("PAYMENT"));
					p.setCid(rset.getInt("C_ID"));
					p.setCNname(rset.getString("C_NAME"));
					p.setAttend(rset.getString("ATTEND"));
					p.setPName(rset.getString("NAME"));
					p.setAcceptDate(rset.getDate("ACCEPT_DATE"));
					
					prevPartList.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return prevPartList;
	}

}
