package com.benedicto.mis.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

//import java.sql.ResultSet;  
//import java.sql.SQLException;  
//import java.util.List;  
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.benedicto.mis.beans.containers.*;

public class subjectsdb {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	



	public Section getSHSectionByID(String sectionID) {
		String sql = "SELECT * from shs_sections WHERE SectionID=?";
		return template.queryForObject(sql, new Object[] { sectionID },
				new BeanPropertyRowMapper<Section>(Section.class));
	}

	public List<Section> getSHSections(String param) {
		String sql = "SELECT * from shs_sections WHERE SectionID LIKE '%" + param + "%' OR SectionName LIKE '%" + param
				+ "%' ";
		return template.query(sql, new RowMapper<Section>() {
			public Section mapRow(ResultSet rs, int row) throws SQLException {
				Section s = new Section();
				s.setSectionID(rs.getInt(1));
				s.setStrandCode(rs.getString(2));
				s.setSectionName(rs.getString(3));
				s.setRoom(rs.getString(4));
				s.setSession(rs.getString(5));
				s.setTeacher(rs.getString(6));

				return s;
			}
		});

	}

	public Section getBSCSectionByID(String sectionID) {
		String sql = "SELECT * from bsc_sections WHERE SectionID=?";
		return template.queryForObject(sql, new Object[] { sectionID },
				new BeanPropertyRowMapper<Section>(Section.class));
	}

	public List<Section> getBSCSections(String param) {
		String sql = "SELECT * from bsc_sections WHERE SectionID LIKE '%" + param + "%' OR SectionName LIKE '%" + param
				+ "%' ";
		return template.query(sql, new RowMapper<Section>() {
			public Section mapRow(ResultSet rs, int row) throws SQLException {
				Section s = new Section();
				s.setSectionID(rs.getInt(1));
				s.setSectionName(rs.getString(2));
				s.setRoom(rs.getString(3));
				s.setSession(rs.getString(4));
				s.setTeacher(rs.getString(5));

				return s;
			}
		});

	}
	
	public int createSchedule(Schedule s) {
		try {
			String sql = "insert into clg_clg_schedules " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			return template.update(sql, null, s.getSubjectCode(), s.getSection(), s.getLecRoom(), s.getLecDays(),
					s.getLecTimeStart(), s.getLecTimeEnd(), s.getLecUnits(), s.getLabRoom(), s.getLabDays(),
					s.getLabTimeStart(), s.getLabTimeEnd(), s.getLabUnits(), s.getSchoolYear(), s.getSemester());

		} catch (Exception ex) {
			System.out.println("Error in create Subject");
			System.out.println(ex.getMessage());
			ex.printStackTrace();

		}
		return 0;
	}


	// Get clg_schedules
	public List<Schedule> getCollegeSchedules(String generalParam, String daysParam) {
		String sql = "SELECT * FROM clg_schedules WHERE (SubjectCode LIKE '%" + generalParam
				+ "%') AND (LecDAYS LIKE '%" + daysParam + "%' OR LabDAYS LIKE '%" + daysParam + "%') ";
		return template.query(sql, new RowMapper<Schedule>() {
			public Schedule mapRow(ResultSet rs, int row) throws SQLException {
				Schedule s = new Schedule();
				s.setScheduleID(rs.getString(1));
				s.setSubjectCode(rs.getString(2));
				s.setSection(rs.getString(3));

				s.setLecRoom(rs.getString(4));
				s.setLecDays(rs.getString(5));
				s.setLecTimeStart(rs.getString(6));
				s.setLecTimeEnd(rs.getString(7));
				s.setLecUnits(rs.getInt(8));

				s.setLabRoom(rs.getString(9));
				s.setLabDays(rs.getString(10));
				s.setLabTimeStart(rs.getString(11));
				s.setLabTimeEnd(rs.getString(12));
				s.setLabUnits(rs.getInt(13));
				s.setSchoolYear(rs.getString(14));
				s.setSemester(rs.getString(15));

				return s;
			}
		});
	}
	
	public List<Schedule> getSHSchedules(String generalParam, String daysParam) {
		String sql = "SELECT * FROM shs_schedules WHERE (SubjectCode LIKE '%" + generalParam
				+ "%') ";
		return template.query(sql, new RowMapper<Schedule>() {
			public Schedule mapRow(ResultSet rs, int row) throws SQLException {
				Schedule s = new Schedule();
				s.setScheduleID(rs.getString(1));
				s.setSubjectCode(rs.getString(2));
				s.setSection(rs.getString(3));

				s.setLecTimeStart(rs.getString(4));
				s.setLecTimeEnd(rs.getString(5));
				s.setLecRoom(rs.getString(6));
				s.setLecDays(rs.getString(7));

				return s;
			}
		});
	}
	
	public List<Schedule> getSHSchedulesBySection(String sectionID) {
		String sql = "SELECT * from bsc_schedules WHERE SectionID = '" + sectionID + "' ";
		return template.query(sql, new RowMapper<Schedule>() {
			public Schedule mapRow(ResultSet rs, int row) throws SQLException {
				Schedule s = new Schedule();

				s.setScheduleID(rs.getString(1));
				s.setSubjectCode(rs.getString(2));
				s.setSection(rs.getString(3));
				s.setLecTimeStart(rs.getString(4));
				s.setLecTimeEnd(rs.getString(5));
				s.setLecRoom(rs.getString(6));
				s.setLecDays(rs.getString(7));

				return s;
			}
		});
	}

	public List<Schedule> getBSCSchedulesBySection(String sectionID) {
		String sql = "SELECT * from bsc_schedules WHERE SectionID = '" + sectionID + "' ";
		return template.query(sql, new RowMapper<Schedule>() {
			public Schedule mapRow(ResultSet rs, int row) throws SQLException {
				Schedule s = new Schedule();

				s.setScheduleID(rs.getString(1));
				s.setSubjectCode(rs.getString(2));
				s.setSection(rs.getString(3));
				s.setLecTimeStart(rs.getString(4));
				s.setLecTimeEnd(rs.getString(5));
				s.setLecRoom(rs.getString(6));
				s.setLecDays(rs.getString(7));

				return s;
			}
		});
	}

	// Get clg_schedules List
	public List<Schedule> getCollegeSchedulesByStudentCurric(String param, String curricID, String studentNo) {
		String sql = "SELECT clg_syllabus.CurriculumID, clg_schedules.*, table1.ScheduleID, table1.StudentNo "
				+ "FROM clg_syllabus INNER JOIN clg_schedules ON clg_syllabus.SubjectCode = clg_schedules.SubjectCode "
				+ "LEFT JOIN (SELECT ScheduleID, StudentNo FROM clg_enlistments WHERE StudentNo='"+ studentNo +"')table1 ON clg_schedules.scheduleID = table1.ScheduleID "
				+ "WHERE clg_syllabus.CurriculumID = '" + curricID + "' AND table1.ScheduleID IS NULL ";
		try {
			return template.query(sql, new RowMapper<Schedule>() {
				public Schedule mapRow(ResultSet rs, int row) throws SQLException {
					Schedule s = new Schedule();
					s.setScheduleID(rs.getString(2));
					s.setSubjectCode(rs.getString(3));
					s.setSection(rs.getString(4));

					s.setLecRoom(rs.getString(5));
					s.setLecDays(rs.getString(6));
					s.setLecTimeStart(rs.getString(7));
					s.setLecTimeEnd(rs.getString(8));
					s.setLecUnits(rs.getInt(9));

					s.setLabRoom(rs.getString(10));
					s.setLabDays(rs.getString(11));
					s.setLabTimeStart(rs.getString(12));
					s.setLabTimeEnd(rs.getString(13));
					s.setLabUnits(rs.getInt(14));

					s.setSchoolYear(rs.getString(15));
					s.setSemester(rs.getString(16));

					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}

	// get enlisted Subjects
	public List<Schedule> getCollegeEnlistedSubjects(String StudentNo) {
		String sql = "SELECT clg_enlistments.StudentNo, clg_schedules.* "
				+ "FROM clg_enlistments INNER JOIN clg_schedules ON clg_enlistments.ScheduleID = clg_schedules.ScheduleID "
				+ "WHERE clg_enlistments.StudentNo = '" + StudentNo + "'  ";
		try {
			return template.query(sql, new RowMapper<Schedule>() {
				public Schedule mapRow(ResultSet rs, int row) throws SQLException {
					Schedule s = new Schedule();
					s.setScheduleID(rs.getString(2));
					s.setSubjectCode(rs.getString(3));
					s.setSection(rs.getString(4));

					s.setLecRoom(rs.getString(5));
					s.setLecDays(rs.getString(6));
					s.setLecTimeStart(rs.getString(7));
					s.setLecTimeEnd(rs.getString(8));
					s.setLecUnits(rs.getInt(8));

					s.setLabRoom(rs.getString(10));
					s.setLabDays(rs.getString(11));
					s.setLabTimeStart(rs.getString(12));
					s.setLabTimeEnd(rs.getString(13));
					s.setLabUnits(rs.getInt(14));

					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}
}
