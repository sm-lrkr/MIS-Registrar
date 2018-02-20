package com.benedicto.mis.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

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

public class studentdb {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	//////////////////STUDENTS//////////////////////
	
	public int createSPR(StudentPersonal s) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		final String sql = "insert into std_pinfo "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		final StudentPersonal _s = s;
		
		try {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement statement = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
					statement.setString(1, null);
					statement.setString(2, _s.getFirstName());
					statement.setString(3, _s.getMiddleName());
					statement.setString(4, _s.getLastName());
					statement.setString(5, _s.getGender());
					statement.setString(6, _s.getBirthDate());
					statement.setString(7, _s.getBirthPlace());
					statement.setString(8, _s.getEmailAddress());
					statement.setString(9, _s.getTelephoneNo());
					statement.setString(10, _s.getContactNo());
					statement.setString(11, _s.getCityAddress());

					statement.setString(12, _s.getRegion());
					statement.setString(13, _s.getProvincialAddress());
					statement.setString(14, _s.getCountry());
					statement.setString(15, _s.getCitizenship());

					statement.setString(16, _s.getReligion());
					statement.setString(17, _s.getMaritalStatus());
					
					statement.setString(18, _s.getAPR());
					statement.setBoolean(19, _s.getWorking());
					statement.setString(20, _s.getWorkingAddress());

					
					return statement;
				}

			}, holder);
			System.out.println("ID:" + holder.getKey().intValue());
			return holder.getKey().intValue();
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		return 0;
		
	}

	public int createFBG(StudentFBG fbg) {
		String sql = "insert into std_fbg " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		final StudentFBG _fbg = fbg;

		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _fbg.getStudentNo());
					ps.setString(2, _fbg.getF_Name());
					ps.setString(3, _fbg.getF_Address());
					ps.setString(4, _fbg.getF_Occupation());
					ps.setString(5, _fbg.getF_ContactNo());
					ps.setString(6, _fbg.getF_Income());

					ps.setString(7, _fbg.getM_Name());
					ps.setString(8, _fbg.getM_Address());
					ps.setString(9, _fbg.getM_Occupation());
					ps.setString(10, _fbg.getM_ContactNo());
					ps.setString(11, _fbg.getM_Income());

					ps.setString(12, _fbg.getG_Name());
					ps.setString(13, _fbg.getG_Address());
					ps.setString(14, _fbg.getG_Relationship());
					ps.setString(15, _fbg.getG_ContactNo());

					ps.setString(16, _fbg.getS_Name());
					ps.setString(17, _fbg.getS_ContactNo());
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return 0;
	}

	public int createCollegeProfile(StudentProfile sp) {
		String sql = "insert into clg_profiles "
				+ 		"values(?,?,?,?,?,?,?,?,?,?,?,?)";
		final StudentProfile _sp = sp;
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _sp.getStudentID());
					ps.setString(2, _sp.getStudentNo());
					ps.setString(3, _sp.getCourseID());
					ps.setString(4, _sp.getCurriculumID());
					ps.setString(5, _sp.getStudentID());
					ps.setString(6, _sp.getEnrollmentStatus());
					ps.setBoolean(7, _sp.isShiftee());
					ps.setString(8	, _sp.getShiftCourse());
					ps.setString(9, _sp.getSemEntry());
					ps.setString(10, _sp.getYearEntry());
					ps.setString(11, _sp.getGraduationYear());
					ps.setString(12, _sp.getApplicationType());
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return 0;
	}
	
	public int createSHProfile(StudentProfile sp) {
		String sql = "insert into shs_profiles "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
		final StudentProfile _sp = sp;
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _sp.getLRN());
					ps.setString(2, _sp.getStudentNo());
					ps.setString(3, _sp.getStrandCode());
					ps.setString(4, _sp.getCurriculumID());
					ps.setString(5, _sp.getStudentStatus());
					ps.setString(6, _sp.getEnrollmentStatus());
					ps.setBoolean(7, _sp.isShiftee());
					ps.setString(8, _sp.getShiftStrand());
					ps.setString(9, _sp.getSemEntry());
					ps.setString(10, _sp.getYearEntry());
					ps.setString(11, _sp.getGraduationYear());
					ps.setString(12, _sp.getApplicationType());
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return 0;
	}
	
	public int updateCollegeProfile(StudentProfile sp) {
		String sql = "update clg_profiles set StudentID = ?, CourseID = ? , CurriculumID = ?, StudentStatus = ?, EnrollmentStatus=?, "
				+ "Shiftee = ?, ShiftCourse = ?, SemEntry = ? , YearEntry = ?, GraduationYear = ?, ApplicationType = ?"
				+ " WHERE StudentNo=?";
				
		final StudentProfile _sp = sp;
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _sp.getStudentID());
				ps.setString(2, _sp.getCourseID());
				ps.setString(3, _sp.getCurriculumID());
				ps.setString(4, _sp.getStudentStatus());
				ps.setString(5, _sp.getEnrollmentStatus());

				ps.setBoolean(6, _sp.isShiftee());
				ps.setString(7, _sp.getShiftCourse());
				ps.setString(8, _sp.getSemEntry());
				ps.setString(9, _sp.getYearEntry());
				ps.setString(10, _sp.getGraduationYear());

				ps.setString(11, _sp.getApplicationType());
				ps.setString(12, _sp.getStudentNo());

			}
		});
	}

	
	
	public int updateSHProfile(StudentProfile sp) {
		String sql = "update shs_profiles set LRN = ?, StrandCode = ? , CurriculumID = ?, StudentStatus = ?, EnrollmentStatus=?, "
				+ "Shiftee = ?, ShiftStrand = ?, SemEntry = ? , YearEntry = ?, GraduationYear = ?, ApplicationType = ?"
				+ " WHERE StudentNo=?";
				
		final StudentProfile _sp = sp;
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _sp.getLRN());
				ps.setString(2, _sp.getStrandCode());
				ps.setString(3, _sp.getCurriculumID());
				ps.setString(4, _sp.getStudentStatus());
				ps.setString(5, _sp.getEnrollmentStatus());

				ps.setBoolean(6, _sp.isShiftee());
				ps.setString(7, _sp.getShiftStrand());
				ps.setString(8, _sp.getSemEntry());
				ps.setString(9, _sp.getYearEntry());
				ps.setString(10, _sp.getGraduationYear());

				ps.setString(11, _sp.getApplicationType());
				ps.setString(12, _sp.getStudentNo());
			}
		});
	}

	public int updateSPR(StudentPersonal s) {
		String sql = "update std_pinfo set FirstName= ? , MiddleName= ?, LastName = ?, Gender = ?, "
				+ 			"BirthDate = ?, BirthPlace = ?, EmailAddress = ?, TelephoneNo = ?, ContactNo = ?, "
				+ 			"CityAddress = ?, Region = ?, ProvincialAddress = ?, Country = ?, Citizenship = ?, "
				+ 			"Religion = ?, MaritalStatus = ?, APR = ?, Working = ?, WorkingAddress = ?    WHERE StudentNo = ? ";
		
		final StudentPersonal _s = s;
		
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _s.getFirstName());
				ps.setString(2, _s.getMiddleName());
				ps.setString(3, _s.getLastName());
				ps.setString(4, _s.getGender());
				ps.setString(5, _s.getBirthDate());

				ps.setString(6, _s.getBirthPlace());
				ps.setString(7, _s.getEmailAddress());
				ps.setString(8, _s.getTelephoneNo());
				ps.setString(9, _s.getContactNo());
				ps.setString(10, _s.getCityAddress());

				ps.setString(11, _s.getRegion());
				ps.setString(12, _s.getProvincialAddress());
				ps.setString(13, _s.getCountry());
				ps.setString(14, _s.getCitizenship());

				ps.setString(15, _s.getReligion());
				ps.setString(16, _s.getMaritalStatus());
				
				ps.setString(17, _s.getAPR());
				ps.setBoolean(18, _s.getWorking());
				ps.setString(19, _s.getWorkingAddress());
				ps.setString(20, _s.getStudentNo());

			
			}
		});
	
	}
	
	public int updateStudentFBG(StudentFBG fbg) {
		String sql = "update std_fbg set F_Name= ? ,F_Address= ?, F_ContactNo=?, F_Occupation=?, F_Income=?, "
				+ "M_Name= ? , M_Address= ?, M_ContactNo=?, M_Occupation=?, M_Income=?, "
				+ "G_Name= ? , G_Address= ?, G_Relationship=?, G_ContactNo=?, "
				+ "S_Name= ? , S_ContactNo=?  WHERE StudentNo=? ";
				
		final StudentFBG _fbg = fbg;
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _fbg.getF_Name());
				ps.setString(2, _fbg.getF_Address());
				ps.setString(3, _fbg.getF_ContactNo());
				ps.setString(4, _fbg.getF_Occupation());
				ps.setString(5, _fbg.getF_Income());

				ps.setString(6, _fbg.getM_Name());
				ps.setString(7, _fbg.getM_Address());
				ps.setString(8, _fbg.getM_ContactNo());
				ps.setString(9, _fbg.getM_Occupation());
				ps.setString(10, _fbg.getM_Income());

				ps.setString(11, _fbg.getG_Name());
				ps.setString(12, _fbg.getG_Address());
				ps.setString(13, _fbg.getG_Relationship());
				ps.setString(14, _fbg.getG_ContactNo());

				ps.setString(15, _fbg.getS_Name());
				ps.setString(16, _fbg.getS_ContactNo());
				ps.setString(17, _fbg.getStudentNo());
			}
		});
	}

	public int deleteSPR(String id) {
		String sql = "delete from std_pinfo where StudentID ='" + id + "'";
		return template.update(sql);
	}

	
	public StudentPersonal getStudentByNo(String studentNo) {
		String sql = "select * from std_pinfo where StudentNo=?";
		return template.queryForObject(sql, new Object[] { studentNo },
				new BeanPropertyRowMapper<StudentPersonal>(StudentPersonal.class));
	}
	
	
	
	public StudentFBG getStudentFBGByNo(String studentNo) {
		try {
			String sql = "select * from std_fbg where StudentNo=?";
			return template.queryForObject(sql, new Object[] { studentNo },
					new BeanPropertyRowMapper<StudentFBG>(StudentFBG.class));
		
		}catch(Exception ex){
			return new StudentFBG();
		}
	}

	public StudentProfile getCollegeProfileByNo(String studentNo) {
		String sql = "SELECT * FROM clg_profiles WHERE StudentNo=?";
		try {

			return template.queryForObject(sql, new Object[] { studentNo },
					new BeanPropertyRowMapper<StudentProfile>(StudentProfile.class));
		} catch (Exception ex) {

			//System.out.println("Error in getStudentCABByID");
			//ex.printStackTrace();
			StudentProfile sp = new StudentProfile();
			sp.setStudentID("");
			return sp;
		}
	}

	public StudentProfile getSHProfileByNo(String studentNo) {
		String sql = "SELECT * FROM shs_profiles WHERE StudentNo=?";
		try {

			return template.queryForObject(sql, new Object[] { studentNo },
					new BeanPropertyRowMapper<StudentProfile>(StudentProfile.class));
		} catch (Exception ex) {
			
			StudentProfile sp = new StudentProfile();
			sp.setLRN("");
			return sp;
			
		}
	}

	public StudentProfile getBSCProfileByNo(String studentNo) {
		String sql = "SELECT * FROM bsc_profiles WHERE StudentNo=?";
		try {

			return template.queryForObject(sql, new Object[] { studentNo },
					new BeanPropertyRowMapper<StudentProfile>(StudentProfile.class));
		} catch (Exception ex) {

			StudentProfile sp = new StudentProfile();
			sp.setLRN("");
			return sp;
		}
	}

	public List<StudentProfile> getAllStudents(String param, String ID) {
		String sql = "SELECT std_pinfo.StudentNo, std_pinfo.FirstName, std_pinfo.MiddleName, std_pinfo.LastName, "
				+ "clg_profiles.StudentID, shs_profiles.LRN, bsc_profiles.LRN, "
				+ "clg_profiles.StudentStatus, shs_profiles.StudentStatus, bsc_profiles.StudentStatus "
				+ "FROM std_pinfo LEFT JOIN clg_profiles ON std_pinfo.StudentNo = clg_profiles.StudentNo "
				+ "LEFT JOIN shs_profiles ON std_pinfo.StudentNo = shs_profiles.StudentNo "
				+ "LEFT JOIN bsc_profiles ON std_pinfo.StudentNo = bsc_profiles.StudentNo "
				+ "WHERE (clg_profiles.StudentID LIKE '%" + param + "%' OR shs_profiles.LRN LIKE '%" + ID
				+ "%' OR std_pinfo.FirstName LIKE '%" + param + "%' OR std_pinfo.LastName LIKE '%" + param + "%') ORDER BY std_pinfo.LastName ";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				String studentID = "";
				String LRNshs = "";
				String LRNbsc = "";
				String theID = "";
				String status = "";

				try {
					studentID = rs.getObject(5).toString();
				} catch (Exception ex) {
					studentID = "";
				}

				try {
					LRNshs = rs.getObject(6).toString();
				} catch (Exception ex) {
					LRNshs = "";
				}

				try {
					LRNbsc = rs.getObject(7).toString();
				} catch (Exception ex) {
					LRNbsc = "";
				}

				if (studentID.equals("")) {
					if (LRNshs.equals("")) {
						theID = LRNbsc;
						status = rs.getString(10);
					} else {
						theID = LRNshs;
						status = rs.getString(9);
					}
				} else {
					theID = studentID;
					status = rs.getString(8);
					
				}
				s.setStudentNo(rs.getString(1));
				s.setFirstName(rs.getString(2));
				s.setMiddleName(rs.getString(3));
				s.setLastName(rs.getString(4));
				s.setStudentID(theID);
				s.setStudentStatus(status);
				return s;
			}
		});
	}

	// Get Students List
	public List<StudentProfile> getCollegeStudents(String param, String courseID) {
		String sql = "SELECT    std_pinfo.FirstName, std_pinfo.MiddleName,std_pinfo.LastName, clg_profiles.* "
				+ "FROM std_pinfo INNER JOIN clg_profiles ON std_pinfo.StudentNo = clg_profiles.StudentNo "
				+ "WHERE (clg_profiles.StudentID LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND clg_profiles.CourseID LIKE '%" + courseID
				+ "%'  ORDER BY std_pinfo.LastName";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setFirstName(rs.getString(1));
				s.setMiddleName(rs.getString(2));
				s.setLastName(rs.getString(3));
				s.setStudentID(rs.getString(4));
				s.setStudentNo(rs.getString(5));
				s.setCourseID(rs.getString(6));
				s.setStudentStatus(rs.getString(8));
				s.setEnrollmentStatus(rs.getString(9));
				
				return s;
			}
		});
	}

	// Get SH Students List
	public List<StudentProfile> getSHStudents(String param, String strandCode) {
		String sql = "SELECT std_pinfo.FirstName, std_pinfo.MiddleName, std_pinfo.LastName, shs_profiles.* "
				+ "FROM std_pinfo INNER JOIN shs_profiles ON std_pinfo.StudentNo = shs_profiles.StudentNo "
				+ "WHERE (shs_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND shs_profiles.StrandCode LIKE '%"
				+ strandCode + "%'  ";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setFirstName(rs.getString(1));
				s.setMiddleName(rs.getString(2));
				s.setLastName(rs.getString(3));
				s.setStudentID(rs.getString(4));
				s.setStudentNo(rs.getString(5));
				s.setStrandCode(rs.getString(6));
				s.setStudentStatus(rs.getString(8));
				s.setEnrollmentStatus(rs.getString(9));
				
				return s;
			}
		});
	}

	public List<StudentProfile> getBSCStudents(String param) {
		String sql = "SELECT std_pinfo.FirstName, std_pinfo.MiddleName, std_pinfo.LastName, bsc_profiles.*  "
				+ "FROM std_pinfo INNER JOIN bsc_profiles ON std_pinfo.StudentNo = bsc_profiles.StudentNo "
				+ "WHERE (bsc_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') ";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setFirstName(rs.getString(1));
				s.setMiddleName(rs.getString(2));
				s.setLastName(rs.getString(3));
				s.setStudentID(rs.getString(4));
				s.setStudentNo(rs.getString(5));
				s.setStudentStatus(rs.getString(8));
				s.setEnrollmentStatus(rs.getString(9));
				
				return s;
			}
		});
	}
	
	public List<StudentProfile> getCollegeStudentsBySchedule(String scheduleID) {
		String sql = "SELECT  clg_enlistments.ScheduleID, clg_profiles.StudentID, std_pinfo.* "
				+ "FROM std_pinfo INNER JOIN clg_enlistments ON std_pinfo.StudentNo = clg_enlistments.StudentNo "
				+ "INNER JOIN clg_profiles ON std_pinfo.StudentNo = clg_profiles.StudentNo "
				+ "WHERE clg_enlistments.ScheduleID = '"+ scheduleID +"' ";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setStudentNo(rs.getString(3));
				s.setStudentID(rs.getString(2));
				s.setFirstName(rs.getString(4));
				s.setMiddleName(rs.getString(5));
				s.setLastName(rs.getString(6));
				return s;
			}
		});
	}

	public List<StudentProfile> getSHStudentsBySection(String sectionID, String param, String year, int sem) {
		String sql = "SELECT shs_profiles.StudentNo, shs_profiles.LRN, std_pinfo.FirstName,  std_pinfo.MiddleName, std_pinfo.LastName, shs_enrollments.SchoolYear, shs_enrollments.Semester, shs_secstudents.SectionID "
				+ "FROM shs_profiles INNER JOIN std_pinfo ON shs_profiles.StudentNo = std_pinfo.StudentNo "
				+ "INNER JOIN shs_secstudents ON shs_profiles.StudentNo = shs_secstudents.StudentNo "
				+ "INNER JOIN shs_enrollments ON shs_profiles.StudentNo = shs_enrollments.StudentNo "
				+ "WHERE (shs_secstudents.SectionID = '"+ sectionID +"' AND shs_enrollments.SchoolYear = '"+year+"' AND shs_enrollments.Semester = '"+sem+"') ";
					

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setStudentNo(rs.getString(1));
				s.setStudentID(rs.getString(2));
				s.setFirstName(rs.getString(3));
				s.setMiddleName(rs.getString(4));
				s.setLastName(rs.getString(5));
				return s;
			}
		});
	}
	
	public List<StudentProfile> getUnenlistedSHStudentsByStrand(String sectionID, String strandCode, String year, int sem) {
		String sql = "SELECT shs_profiles.StudentNo, shs_profiles.LRN, shs_profiles.StrandCode, std_pinfo.FirstName,  std_pinfo.MiddleName, std_pinfo.LastName, shs_enrollments.SchoolYear, shs_enrollments.Semester, shs_secstudents.SectionID, shs_profiles.StrandCode  "
				+ "FROM shs_profiles INNER JOIN std_pinfo ON shs_profiles.StudentNo = std_pinfo.StudentNo "
				+ "LEFT JOIN shs_secstudents ON shs_profiles.StudentNo = shs_secstudents.StudentNo "
				+ "LEFT JOIN shs_enrollments ON shs_profiles.StudentNo = shs_enrollments.StudentNo "
				+ "WHERE ((shs_secstudents.SectionID IS NULL) OR (shs_enrollments.SchoolYear != '"+year+"' OR shs_enrollments.Semester != '"+sem+"')) "
						+ "AND shs_profiles.StrandCode= '"+strandCode+"'";
	
		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setStudentNo(rs.getString(1));
				s.setStudentID(rs.getString(2));
				s.setStrandCode(rs.getString(3));
				s.setFirstName(rs.getString(4));
				s.setMiddleName(rs.getString(5));
				s.setLastName(rs.getString(6));
				return s;
			}
		});
	}

	public List<StudentProfile> getBSCStudentsBySection(String sectionID, String param, String year, int sem) {
		String sql = "SELECT bsc_secstudents.SectionID,bsc_profiles.LRN,  std_pinfo.*, enrollments.SchoolYear, enrollments.Semester "
				+ "FROM bsc_secstudents INNER JOIN bsc_profiles ON bsc_secstudents.StudentNo = bsc_profiles.StudentNo "
				+ "INNER JOIN std_pinfo ON bsc_secstudents.StudentNo = std_pinfo.StudentNo "
				+ "INNER JOIN enrollments ON bsc_secstudents.StudentNo = enrollments.StudentNo "
				+ "WHERE (bsc_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND bsc_secstudents.SectionID = '" + sectionID
				+ "' AND enrollments.SchoolYear = '" + year + "' AND enrollments.Semester = '" + sem + "'   ";

		return template.query(sql, new RowMapper<StudentProfile>() {
			public StudentProfile mapRow(ResultSet rs, int row) throws SQLException {
				StudentProfile s = new StudentProfile();
				s.setStudentID(rs.getString(2));
				s.setFirstName(rs.getString(5));
				s.setMiddleName(rs.getString(6));
				s.setLastName(rs.getString(7));
				return s;
			}
		});
	}

	
	//Enroll Student
	public int enrollStudentToCurrentSem(StudentProfile sp) {
		String sql = "INSERT INTO enrollment(StudentID, SchoolYear, Semester, CurriculumID) " + "VALUES(?,?,?,?)";
		return template.update(sql, sp.getStudentID(), "2017-2018", 1, sp.getCurriculumID());
	}

	// enlist Student Subjects
	public int enlistCollegeStudentSchedules(Enrollment e, String ScheduleID) {
		String sql = "insert into clg_enlistments(StudentNo, ScheduleID, EnrollmentNo) " + "values(?,?,?)";
		return template.update(sql, e.getStudentNo(), ScheduleID, e.getEnrollmentNo());
	}
	
	public int enlistSHToSection(Enrollment e, String sectionID) {
		String sql = "insert into shs_secstudents(StudentNo, SectionID, EnrollmentNo) " + "values(?,?,?)";
		return template.update(sql, e.getStudentNo(), sectionID, e.getEnrollmentNo());
	}
	
	public int enlistSHStudentSchedules(Enrollment e, String ScheduleID) {
		String sql = "insert into shs_enlistments(StudentNo, ScheduleID, EnrollmentNo) " + "values(?,?,?)";
		return template.update(sql, e.getStudentNo(), ScheduleID, e.getEnrollmentNo());
	}
	
	


	// unenlist Student Subjects
	public int withdrawStudentSubjects(Enrollment e, String ScheduleID) {
		String sql = "DELETE FROM clg_enlistments WHERE EnrollmentNo = ? AND ScheduleID = ?";
		return template.update(sql, e.getEnrollmentNo(), ScheduleID);
	}

	public int withdrawSHFromSection(Enrollment e, String sectionID) {
		String sql = "DELETE FROM shs_secstudents WHERE StudentNo=? AND SectionID=? AND EnrollmentNo=?";
		return template.update(sql, e.getStudentNo(), sectionID,  e.getEnrollmentNo());
	}
	
	public int withdrawSHSubjects(Enrollment e, String ScheduleID) {
		String sql = "DELETE FROM shs_enlistments WHERE EnrollmentNo = ? AND ScheduleID = ?";
		return template.update(sql, e.getEnrollmentNo(), ScheduleID);
	}
	
	
	////////////////////////////////////////////////

	///////////////////SUBJECTS/////////////////////
	
	
	public int createCollegeSubject(Subject s) {
		String sql = "insert into clg_subjects(SubjectCode, SubjectDesc, LecUnits, LabUnits, PreRequisites) " + "values(?,?,?,?,?)";
		return template.update(sql, s.getSubjectCode(), s.getSubjectDesc(), s.getLecUnits(), s.getLabUnits(), s.getPreRequisites());
	}
	
	public int createSHSubject(Subject s) {
		String sql = "insert into shs_subjects(SubjectCode, SubjectDesc, PreRequisites, Type) " + "values(?,?,?,?)";
		return template.update(sql, s.getSubjectCode(), s.getSubjectDesc(), s.getPreRequisites(), s.getType());
	}
	
	public int updateCollegeSubject(Subject s, String subjectCode) {
		String sql = "update clg_subjects set SubjectCode = ?, SubjectDesc = ? , LecUnits = ?, LabUnits = ?, PreRequisites = ? "
				+ " WHERE SubjectCode=?";
				
		final Subject _s = s;
		final String _subjectCode = subjectCode;
		
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _s.getSubjectCode());
				ps.setString(2, _s.getSubjectDesc());
				ps.setInt(3, _s.getLecUnits());
				ps.setInt(4, _s.getLabUnits());
				ps.setString(5, _s.getPreRequisites());
				ps.setString(6, _subjectCode);
			}
		});
	}
	
	public int updateSHSubject(Subject s, String subjectCode) {
		String sql = "UPDATE shs_subjects set SubjectCode = ?, SubjectDesc = ? , PreRequisites = ?, Type=? "
				+ " WHERE SubjectCode=?";
			
		final Subject _s = s;
		final String _subjectCode = subjectCode;
		
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, _s.getSubjectCode());
				ps.setString(2, _s.getSubjectDesc());
				ps.setString(3, _s.getPreRequisites());
				ps.setString(4, _s.getType());
				ps.setString(5, _subjectCode);
			}
		});
	}


	// Get College Subject By Code
	public Subject getCollegeSubjectByCode(String subjCode) {
		String sql = "select * from clg_subjects where SubjectCode=?";
		return template.queryForObject(sql, new Object[] { subjCode },
				new BeanPropertyRowMapper<Subject>(Subject.class));
	}

	// Get College Subjects List
	public List<Subject> getCollegeSubjects(String param) {
		String sql = "SELECT * FROM clg_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int row) throws SQLException {
				Subject s = new Subject();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setLecUnits(rs.getInt(3));
				s.setLabUnits(rs.getInt(4));
				s.setPreRequisites(rs.getString(5));
				return s;
			}
		});
	}
	
	// Get SH Subject By Code
	public Subject getSHSubjectByCode(String subjCode) {
		String sql = "select * from shs_subjects where SubjectCode=?";
		return template.queryForObject(sql, new Object[] { subjCode },
				new BeanPropertyRowMapper<Subject>(Subject.class));
	}

	// Get SH Subjects List
	public List<Subject> getSHSubjects(String param) {
		String sql = "SELECT * FROM shs_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int row) throws SQLException {
				Subject s = new Subject();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setPreRequisites(rs.getString(3));
				s.setType(rs.getString(4));
				return s;
			}
		});
	}

	public List<Subject> getBSCSubjects(String param) {
		String sql = "SELECT * FROM bsc_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int row) throws SQLException {
				Subject s = new Subject();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setPreRequisites(rs.getString(3));
				s.setType(rs.getString(4));
				return s;
			}
		});
	}



	// Get Curriculum Prospectus()
	public List<CurriculumSubject> getCurriculumSubjects(String curricID, int year, int sem) {
		String sql = "SELECT clg_syllabus.*, clg_subjects.* "
				+ "FROM clg_syllabus INNER JOIN clg_subjects ON clg_syllabus.SubjectCode = clg_subjects.SubjectCode "
				+ "WHERE clg_syllabus.CurriculumID = '" + curricID + "' AND clg_syllabus.Year= '" + year
				+ "' AND clg_syllabus.Semester = '" + sem + "' ";

		return template.query(sql, new RowMapper<CurriculumSubject>() {
			public CurriculumSubject mapRow(ResultSet rs, int row) throws SQLException {
				CurriculumSubject s = new CurriculumSubject();
				s.setSubjectCode(rs.getString(6));
				s.setSubjectDesc(rs.getString(7));
				s.setLecUnits(rs.getInt(8));
				s.setLabUnits(rs.getInt(9));
				s.setPreRequisites(rs.getString(10));
				s.setYear(rs.getInt(3));
				s.setSem(rs.getInt(4));
				s.setMajor(rs.getBoolean(5));
				return s;
			}
		});
	}

	public List<StrandSubject> getStrandSubjects(String curricID) {
		String sql = "SELECT shs_syllabus.*, shs_subjects.* "
				+ "FROM shs_syllabus INNER JOIN shs_subjects ON shs_syllabus.SubjectCode = shs_subjects.SubjectCode "
				+ "WHERE shs_syllabus.CurriculumID = '" + curricID + "' ";

		return template.query(sql, new RowMapper<StrandSubject>() {
			public StrandSubject mapRow(ResultSet rs, int row) throws SQLException {

				StrandSubject strandSubject = new StrandSubject();
				Subject subject = new Subject();

				strandSubject.setYear(rs.getInt(3));
				strandSubject.setSem(rs.getInt(4));
				subject.setSubjectCode(rs.getString(5));
				subject.setSubjectDesc(rs.getString(6));
				subject.setPreRequisites(rs.getString(7));
				subject.setType(rs.getString(8));

				strandSubject.setSubject(subject);

				return strandSubject;
			}
		});
	}

	public List<Subject> getSubjectsNotInCurriculum(String curricID) {
		String sql = "SELECT clg_syllabus.*, subject.* "
				+ "FROM clg_syllabus INNER JOIN subject ON clg_syllabus.SubjectCode = subject.SubjectCode "
				+ "WHERE NOT clg_syllabus.CurriculumID = '" + curricID + "' ";

		return template.query(sql, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int row) throws SQLException {
				Subject s = new Subject();
				s.setSubjectCode(rs.getString(6));
				s.setLecUnits(rs.getInt(7));
				s.setLabUnits(rs.getInt(8));
				return s;
			}
		});
	}

	public int saveCurriculumSubjects(String curricID, String subjectCode, int year, int sem) {
		String sql = "insert into clg_syllabus " + "values(?,?,?,?,?)";
		return template.update(sql, curricID, subjectCode, year, sem, 0);
	}

	// Get Student Subject Grades
	public List<SubjectGrades> getCollegeGrades(String enrollmentNo) {
//		String sql = "SELECT e.StudentID, sc.SubjectCode, su.SubjectDesc, su.LecUnits, su.LabUnits, "
//				+ "g.Prelim, g.Midterm, g.Final, g.GradeEquivalent, g.DateModified, sc.SchoolYear, sc.Semester "
//				+ "FROM clg_enlistments AS e INNER JOIN  clg_schedules AS sc ON e.ScheduleID = sc.ScheduleID "
//				+ "INNER JOIN subject AS su ON sc.SubjectCode = su.SubjectCode "
//				+ "INNER JOIN grades AS g ON e.clg_enlistmentsID = g.clg_enlistmentsID " + "WHERE e.StudentID = '"
//				+ StudentID + "'  ORDER BY sc.SchoolYear, sc.Semester ";
//				
		String sql = "SELECT clg_grades.*, clg_subjects.* "
				+ "FROM clg_grades INNER JOIN clg_subjects ON clg_grades.SubjectCode = clg_subjects.SubjectCode "
				+ "WHERE clg_grades.EnrollmentNo = '"+ enrollmentNo +"'  ";
		
		try {
			return template.query(sql, new RowMapper<SubjectGrades>() {
				public SubjectGrades mapRow(ResultSet rs, int row) throws SQLException {
					SubjectGrades s = new SubjectGrades();
					s.setEnrollmentNo(rs.getString(1));
					s.setSubjectCode(rs.getString(2));
					s.setPrelimGrade(rs.getFloat(3));
					s.setMidtermGrade(rs.getFloat(4));
					s.setFinalGrade(rs.getFloat(5));
					s.setEquivalentGrade(rs.getFloat(6));
					s.setDateModified(rs.getString(7));
					s.setSubjectDesc(rs.getString(10));
					s.setLecUnits(rs.getInt(11));
					s.setLabUnits(rs.getInt(12));
					
					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}
	
	
	public List<SubjectGrades> getSHGrades(String enrollmentNo) {
//		String sql = "SELECT e.StudentID, sc.SubjectCode, su.SubjectDesc, su.LecUnits, su.LabUnits, "
//				+ "g.Prelim, g.Midterm, g.Final, g.GradeEquivalent, g.DateModified, sc.SchoolYear, sc.Semester "
//				+ "FROM clg_enlistments AS e INNER JOIN  clg_schedules AS sc ON e.ScheduleID = sc.ScheduleID "
//				+ "INNER JOIN subject AS su ON sc.SubjectCode = su.SubjectCode "
//				+ "INNER JOIN grades AS g ON e.clg_enlistmentsID = g.clg_enlistmentsID " + "WHERE e.StudentID = '"
//				+ StudentID + "'  ORDER BY sc.SchoolYear, sc.Semester ";
//				
		String sql = "SELECT shs_grades.*, shs_subjects.* "
				+ "FROM shs_grades INNER JOIN shs_subjects ON shs_grades.SubjectCode = shs_subjects.SubjectCode "
				+ "WHERE shs_grades.EnrollmentNo = '"+ enrollmentNo +"'  ";
		
		try {
			return template.query(sql, new RowMapper<SubjectGrades>() {
				public SubjectGrades mapRow(ResultSet rs, int row) throws SQLException {
					SubjectGrades s = new SubjectGrades();
					s.setEnrollmentNo(rs.getString(1));
					s.setSubjectCode(rs.getString(2));
					s.setPrelimGrade(rs.getFloat(3));
					s.setMidtermGrade(rs.getFloat(4));
					s.setFinalGrade(rs.getFloat(5));
					s.setEquivalentGrade(rs.getFloat(6));
					s.setDateModified(rs.getString(7));
					s.setSubjectDesc(rs.getString(10));
					
					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}
	////////////////////////////////////////////////
	
	
	////////////COURSES-STRANDS-CURRICULUMS/////////
	
	
	public int createCourse(Course c) {
		String sql = "insert into clg_courses(CourseID, CourseDesc, DepartmentCode) " + "values(?,?,?)";
		return template.update(sql, c.getCourseID(), c.getCourseDesc(), c.getDepartmentCode());
	}

	public int createCurriculum(Curriculum c) {
		try {
			String sql = "insert into clg_curriculums(CurriculumDesc, CourseID, YearImplemented) " + "values(?,?,?)";
			return template.update(sql, c.getCurriculumDesc(), c.getCourseID(), c.getYearImplemented());

		} catch (Exception ex) {
			System.out.println("Error in createCurriculum: ");
			System.out.println(ex.getMessage());

			ex.printStackTrace();
		}
		return 0;
	}

	
	// Get Courses List
	public List<Course> getCollegeCourses(String param) {
		String sql = "SELECT * from clg_courses WHERE CourseID LIKE '%" + param + "%' OR CourseDesc LIKE '%" + param
				+ "%' OR DepartmentCode LIKE '%" + param + "%' ";
		return template.query(sql, new RowMapper<Course>() {
			public Course mapRow(ResultSet rs, int row) throws SQLException {
				Course c = new Course();
				c.setCourseID(rs.getString(1));
				c.setCourseDesc(rs.getString(2));
				c.setDepartmentCode(rs.getString(3));
				return c;
			}
		});
	}
	

	public Course getCourseByID(String courseID) {
		String sql = "SELECT * from clg_courses WHERE CourseID=?";
		try {
			return template.queryForObject(sql, new Object[] { courseID }, new BeanPropertyRowMapper<Course>(Course.class));
		}catch(Exception ex) {
			Course course = new Course();
			course.setCourseID("");
			course.setCourseDesc("");
			return course;
		}
	}

	// Get Shs strands list
	public List<Strand> getSHStrands(String param) {
		String sql = "SELECT * from shs_strands WHERE StrandCode LIKE '%" + param + "%' OR StrandDesc LIKE '%" + param
				+ "%' OR Track LIKE '%" + param + "%' OR Major LIKE '%" + param + "%'";
		return template.query(sql, new RowMapper<Strand>() {
			public Strand mapRow(ResultSet rs, int row) throws SQLException {
				Strand s = new Strand();

				s.setStrandCode(rs.getString(1));
				s.setTrack(rs.getString(2));
				s.setStrandDesc(rs.getString(3));
				s.setMajor(rs.getString(4));

				return s;
			}
		});

	}

	public Strand getSHStrandByCode(String strandCode) {
		String sql = "SELECT * from shs_strands WHERE StrandCode=?";
		return template.queryForObject(sql, new Object[] { strandCode },
				new BeanPropertyRowMapper<Strand>(Strand.class));
	}

	
	// Get Curriculum
	public Curriculum getCollegeCurriculumByID(String id) {
		String sql = "select * from clg_curriculums where CurriculumID=?";
		return template.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<Curriculum>(Curriculum.class));
	}

	// Get Curriculum List
	public List<Curriculum> getCollegeCurriculums(String param) {
		String sql = "SELECT * FROM clg_curriculums WHERE CurriculumID LIKE '%" + param + "%' OR CurriculumDesc LIKE '%"
				+ param + "%' OR CourseID LIKE '%" + param + "%' ";
		return template.query(sql, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(1));
				c.setCurriculumDesc(rs.getString(2));
				c.setCourseID(rs.getString(3));
				return c;
			}
		});
	}
	
	public List<Curriculum> getCollegeCurriculumsBySubject(String subjectCode) {
		String sql = "SELECT clg_subjects.SubjectCode, clg_curriculums.* "
				+ "FROM clg_subjects INNER JOIN clg_syllabus ON clg_subjects.SubjectCode = clg_syllabus.SubjectCode  "
				+ "INNER JOIN clg_curriculums ON clg_syllabus.CurriculumID = clg_curriculums.CurriculumID "	
				+ "WHERE clg_subjects.SubjectCode = '" + subjectCode + "'";
		return template.query(sql, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(2));
				c.setCurriculumDesc(rs.getString(3));
				c.setCourseID(rs.getString(4));
				c.setYearImplemented(rs.getString(5));
				return c;
			}
		});
	}

	public List<Curriculum> getSHCurriculums(String param) {
		String sql = "SELECT * FROM shs_curriculums WHERE CurriculumID LIKE '%" + param + "%' OR CurriculumDesc LIKE '%"
				+ param + "%' OR StrandCode LIKE '%" + param + "%' ";
		return template.query(sql, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(1));
				c.setCurriculumDesc(rs.getString(2));
				c.setCourseID(rs.getString(3));
				return c;
			}
		});
	}
	
	public List<Curriculum> getSHCurriculumsBySubject(String subjectCode) {
		String sql = "SELECT shs_subjects.SubjectCode, shs_curriculums.* "
				+ "FROM shs_subjects INNER JOIN shs_syllabus ON shs_subjects.SubjectCode = shs_syllabus.SubjectCode  "
				+ "INNER JOIN shs_curriculums ON shs_syllabus.CurriculumID = shs_curriculums.CurriculumID "	
				+ "WHERE shs_subjects.SubjectCode = '" + subjectCode + "'";
		return template.query(sql, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(2));
				c.setCurriculumDesc(rs.getString(3));
				c.setCourseID(rs.getString(4));
				c.setYearImplemented(rs.getString(5));
				return c;
			}
		});
	}

	public List<Curriculum> getBSCCurriculums(String param) {
		String sql = "SELECT * FROM bsc_curriculums WHERE CurriculumID LIKE '%" + param + "%' OR CurriculumDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(1));
				c.setCurriculumDesc(rs.getString(2));
				c.setCourseID(rs.getString(3));
				return c;
			}
		});
	}

	public List<Curriculum> getCurriculumsByCourse(String CourseID) {
		String sql = "SELECT * FROM clg_curriculums WHERE CourseID = ? ";
		return template.query(sql, new String[] { CourseID }, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(1));
				c.setCurriculumDesc(rs.getString(2));
				c.setCourseID(rs.getString(3));
				return c;
			}
		});
	}

	// get SH curriculums
	public List<Curriculum> getSHCurriculumsByStrand(String strandCode) {
		String sql = "SELECT * FROM shs_curriculums WHERE StrandCode = ? ";
		return template.query(sql, new String[] { strandCode }, new RowMapper<Curriculum>() {
			public Curriculum mapRow(ResultSet rs, int row) throws SQLException {
				Curriculum c = new Curriculum();
				c.setCurriculumID(rs.getString(1));
				c.setCurriculumDesc(rs.getString(2));
				c.setCourseID(rs.getString(3));
				c.setYearImplemented(rs.getString(4));
				return c;
			}
		});
	}

	// Get Latest Curriculum
	public Curriculum getLatestCourseCurriculum(String CourseID) {
		String sql = "SELECT * FROM clg_curriculums WHERE CourseID = ? ORDER BY CurriculumID DESC LIMIT 1";
		try {
			System.out.println("Successfully returned latest");
			return template.queryForObject(sql, new Object[] { CourseID },
					new BeanPropertyRowMapper<Curriculum>(Curriculum.class));
		} catch (Exception ex) {
			System.out.println("Error in getLatestCourseCurriculum");
			ex.printStackTrace();
		}
		return null;
	}

	////////////////////////////////////////////////
	
	////////////////Sections-Schedules///////////////////
	
	public Section getSHSectionByID(String sectionID) {
		String sql = "SELECT shs_sections.*, CONCAT(personnels.first_name,' ', personnels.last_name) AS personnelName "
				+ "from shs_sections INNER JOIN personnels ON shs_sections.PersonnelID = personnels.personnelID "
				+ "WHERE SectionID=?";
		return template.queryForObject(sql, new Object[] { sectionID },
				new BeanPropertyRowMapper<Section>(Section.class));
	}

	public List<Section> getSHSections(String param) {
		String sql = "SELECT shs_sections.*, personnels.first_name, personnels.last_name  "
				+ "from shs_sections INNER JOIN personnels ON shs_sections.PersonnelID = personnels.PersonnelID "
				+ "WHERE SectionID LIKE '%" + param + "%' OR SectionName LIKE '%" + param +"%' ";
		return template.query(sql, new RowMapper<Section>() {
			public Section mapRow(ResultSet rs, int row) throws SQLException {
				Section s = new Section();
				s.setSectionID(rs.getInt(1));
				s.setStrandCode(rs.getString(2));
				s.setSectionName(rs.getString(3));
				s.setRoom(rs.getString(4));
				s.setSession(rs.getString(5));
				s.setPersonnelID(rs.getString(6));
				s.setPersonnelName(rs.getString(7) +" "+ rs.getString(8));

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
				s.setPersonnelID(rs.getString(5));

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
	
	public Schedule getCollegeScheduleByID(String scheduleID) {
		String sql = "SELECT clg_schedules.*, CONCAT(personnels.first_name,' ', personnels.last_name) AS personnelName "
				+ "FROM clg_schedules INNER JOIN personnels ON clg_schedules.PersonnelID = personnels.PersonnelID  "
				+ "WHERE ScheduleID=? ";
		return template.queryForObject(sql, new Object[] { scheduleID },
				new BeanPropertyRowMapper<Schedule>(Schedule.class));
	}

	// Get clg_schedules
	public List<Schedule> getCollegeSchedules(String generalParam, String daysParam) {
		String sql = "SELECT clg_schedules.*, personnels.first_name, personnels.last_name "
				+ " FROM clg_schedules INNER JOIN personnels ON clg_schedules.PersonnelID = personnels.PersonnelID "
				+ "WHERE (SubjectCode LIKE '%" + generalParam + "%') AND (LecDAYS LIKE '%" + daysParam + "%' OR LabDAYS LIKE '%" + daysParam + "%') ";
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
				s.setPersonnelID(rs.getString(16));
				s.setPersonnelName(rs.getString(17) + " "+ rs.getString(18));
				return s;
			}
		});
	}
	
	public List<Schedule> getSHSchedules(String generalParam, String daysParam) {
		String sql = "SELECT shs_schedules.*, personnels.first_name, personnels.last_name"
				+ " FROM shs_schedules INNER JOIN personnels ON shs_schedules.PersonnelID = personnels.PersonnelID "
				+ " WHERE (SubjectCode LIKE '%" + generalParam + "%') ";
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
				s.setPersonnelID(rs.getString(8));
				s.setPersonnelName(rs.getString(9) + rs.getString(10));
				return s;
			}
		});
	}
	
	public List<Schedule> getSHSchedulesBySection(String sectionID) {
		String sql = "SELECT shs_schedules.*, personnels.first_name, personnels.last_name "
				+ "FROM shs_schedules INNER JOIN personnels ON shs_schedules.PersonnelID = personnels.PersonnelID "
				+ "WHERE SectionID = '" + sectionID + "' ";
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
				s.setPersonnelID(rs.getString(8));
				s.setPersonnelName(rs.getString(9) + rs.getString(10));
				
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
					s.setPersonnelID(rs.getString(17));

					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}
	
	public List<Schedule> getCollegeSchedulesByCurric(String curricID, String schoolYear, int semester) {
		String sql = "SELECT clg_syllabus.SubjectCode, clg_schedules.*, CONCAT(personnels.first_name,' ', personnels.last_name) AS personnelName  "
				+ "FROM clg_syllabus INNER JOIN clg_schedules ON clg_syllabus.SubjectCode = clg_schedules.SubjectCode "
				+ "INNER JOIN personnels ON clg_schedules.PersonnelID = personnels.PersonnelID "
				+ "WHERE clg_syllabus.CurriculumID = '"+ curricID +"' AND clg_schedules.SchoolYear= '"+ schoolYear+"' AND clg_schedules.Semester='"+semester+"' ";
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
					s.setPersonnelID(rs.getString(17));
					s.setPersonnelName(rs.getString(18));
					
					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}

	public List<Schedule> getCollegeSchedulesByCourse(String courseID, String schoolYear, int semester, String year) {
		String sql = "SELECT clg_curriculums.courseID, clg_schedules.*, CONCAT(personnels.first_name,' ', personnels.last_name) AS personnelName, clg_syllabus.CurriculumID, clg_syllabus.Year  "
				+ "FROM clg_schedules INNER JOIN clg_syllabus ON clg_schedules.SubjectCode = clg_syllabus.SubjectCode "
				+ "INNER JOIN clg_curriculums ON clg_syllabus.CurriculumID = clg_curriculums.CurriculumID "
				+ "INNER JOIN personnels ON clg_schedules.PersonnelID = personnels.PersonnelID "
				+ "WHERE clg_curriculums.courseID = '"+ courseID +"' AND clg_schedules.SchoolYear= '"+ schoolYear+"' AND clg_schedules.Semester='"+semester+"' AND CAST(clg_syllabus.Year as CHAR) LIKE '%"+ year +"%' ";
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
					s.setPersonnelID(rs.getString(20));
					s.setPersonnelName(rs.getString(18));
					
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
	public List<Schedule> getCollegeEnlistedSubjects(String StudentNo, String enrollmentNo) {
		String sql = "SELECT clg_enlistments.StudentNo, clg_schedules.* "
				+ "FROM clg_enlistments INNER JOIN clg_schedules ON clg_enlistments.ScheduleID = clg_schedules.ScheduleID "
				+ "WHERE clg_enlistments.StudentNo = '" + StudentNo + "' AND clg_enlistments.EnrollmentNo = '"+ enrollmentNo +"'  ";
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

					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}
	
	public List<Schedule> getSHEnlistedSubjects(String StudentNo, String enrollmentNo) {
		String sql = "SELECT shs_enlistments.StudentNo, shs_schedules.*,  personnels.first_name, personnels.last_name "
				+ "FROM shs_enlistments INNER JOIN shs_schedules ON shs_enlistments.ScheduleID = shs_schedules.ScheduleID "
				+ "INNER JOIN personnels ON shs_schedules.PersonnelID = personnels.PersonnelID "
				+ "WHERE shs_enlistments.StudentNo = '" + StudentNo + "' AND  shs_enlistments.EnrollmentNo = '"+ enrollmentNo +"' ";
		
		try {
			return template.query(sql, new RowMapper<Schedule>() {
				public Schedule mapRow(ResultSet rs, int row) throws SQLException {
					Schedule s = new Schedule();
					s.setScheduleID(rs.getString(2));
					s.setSubjectCode(rs.getString(3));
					s.setSection(rs.getString(4));

					s.setLecTimeStart(rs.getString(5));
					s.setLecTimeEnd(rs.getString(6));
					s.setLecRoom(rs.getString(7));
					s.setLecDays(rs.getString(8));
					s.setPersonnelID(rs.getString(9));
					s.setPersonnelName(rs.getString(10)+" "+rs.getString(11) );
					
					return s;
				}
			});

		} catch (Exception ex) {
			System.out.println("Error in getSchedylesByStudentCurriculum");
			ex.printStackTrace();
		}
		return null;
	}

	
	
	///////////////////////////////////////////////
	
	
	public int addCollegeSubjectGrading(Schedule s, String enrollmentNo, String date) {
		String sql = "INSERT INTO clg_grades(EnrollmentNo, SubjectCode, DateModified, PersonnelID) VALUES(?,?,?,?)";

		final String _enrollmentNo = enrollmentNo;
		final Locale locale = new Locale("en_US");
		
		final String _subjectCode = s.getSubjectCode();
		final String _date = date;
		final String _personnelID = s.getPersonnelID();
		
		
		
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _enrollmentNo);
					ps.setString(2, _subjectCode);
					ps.setString(3, _date);
					ps.setString(4, _personnelID);
				
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return 0;
	}
	
	public int updateCollegeSubjectGrading(SubjectGrades sg) {
		String sql = "update clg_grades set Prelim = ?, Midterm = ? , Final = ?, GradeEquivalent = ?, DateModified= ? "
				+ " WHERE EnrollmentNo=? AND SubjectCode=? ";
				
		final SubjectGrades _sg = sg;
		return template.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setFloat(1, _sg.getPrelimGrade());
				ps.setFloat(2, _sg.getMidtermGrade());
				ps.setFloat(3, _sg.getFinalGrade());
				ps.setFloat(4, _sg.getEquivalentGrade());
				ps.setString(5, _sg.getDateModified());
				ps.setString(6, _sg.getEnrollmentNo());
				ps.setString(7, _sg.getSubjectCode());
				
			}
		});
	}
	
	public int removeCollegeSubjectsGrading(Enrollment e, String subjectCode) {
		String sql = "DELETE FROM clg_grades WHERE EnrollmentNo = ? AND SubjectCode = ?";
		return template.update(sql, e.getEnrollmentNo(), subjectCode);
	}
	
	public int addSHSubjectGrading(Schedule s, String enrollmentNo) {
		String sql = "INSERT INTO shs_grades(EnrollmentNo, SubjectCode, PersonnelID) VALUES(?,?,?)";

		final String _enrollmentNo = enrollmentNo;
		final String _subjectCode = s.getSubjectCode();
		final String _personnelID = s.getPersonnelID();
		
		
		
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _enrollmentNo);
					ps.setString(2, _subjectCode);
					ps.setString(3, _personnelID);
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return 0;
	}
	
	public int removeSHSubjectsGrading(Enrollment e, String subjectCode) {
		String sql = "DELETE FROM shs_grades WHERE EnrollmentNo = ? AND SubjectCode = ?";
		return template.update(sql, e.getEnrollmentNo(), subjectCode);
	}
	
	public int removeSubjectGradings(String EnrollmentNo) {
		String sql = "DELETE FROM std_enrollments WHERE EnrollmentNo = ? ";
		return template.update(sql, EnrollmentNo);
	}
	
	public int addNewStudentEnrollment(String studentNo, String schoolYear, int semester) {
		String sql = "INSERT INTO std_enrollments(StudentNo, SchoolYear, Semester) " + " VALUES(?,?,?)";

		final String _studentNo = studentNo;
		final String _schoolYear = schoolYear;
		final int _semester = semester;
		
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _studentNo);
					ps.setString(2, _schoolYear);
					ps.setInt(3, _semester);
				
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}
	
	public int addNewSHEnrollment(Enrollment e) {
		String sql = "INSERT INTO shs_enrollments(StudentNo, SchoolYear, Semester, SectionID, StrandCode) " + " VALUES(?,?,?,?,?)";

		final String _studentNo = e.getStudentNo();
		final String _schoolYear = e.getSchoolYear();
		final int _semester = e.getSemester();
		final String _sectionID = e.getSectionID();
		final String _strandCode = e.getStrandCode(); 
		
		try {
			return template.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, _studentNo);
					ps.setString(2, _schoolYear);
					ps.setInt(3, _semester);
					ps.setString(4, _sectionID);
					ps.setString(5, _strandCode);
				}
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}
	
	public int removeStudentEnrollment(String EnrollmentNo) {
		String sql = "DELETE FROM std_enrollments WHERE EnrollmentNo = ? ";
		return template.update(sql, EnrollmentNo);
	}
	
	public int removeSHEnrollment(String EnrollmentNo) {
		String sql = "DELETE FROM shs_enrollments WHERE EnrollmentNo = ? ";
		return template.update(sql, EnrollmentNo);
	}
	
	
	public Enrollment getCollegeEnrollmentBySY(String studentNo, String schoolYear, int sem){
		String sql = "select * from std_enrollments where StudentNo = ? AND SchoolYear = ? AND Semester = ? "
						+ "ORDER BY SchoolYear, Semester LIMIT 1	";
		try {

			return template.queryForObject(sql, new Object[] {studentNo, schoolYear, sem},
					new BeanPropertyRowMapper<Enrollment>(Enrollment.class));
		}catch(Exception ex) {
			ex.printStackTrace();
			Enrollment e = new Enrollment();
			e.setEnrollmentNo("");
			System.out.println("Returning empty enrollment: ");
			return e;
		}
		
	}
	
	public Enrollment getSHEnrollmentBySY(String studentNo, String schoolYear, int sem){
		String sql = "select * from shs_enrollments where StudentNo = ? AND SchoolYear = ? AND Semester = ? "
						+ "ORDER BY SchoolYear, Semester LIMIT 1	";
		try {
			return template.queryForObject(sql, new Object[] {studentNo, schoolYear, sem},
					new BeanPropertyRowMapper<Enrollment>(Enrollment.class));
		}catch(Exception ex) {
			ex.printStackTrace();
			Enrollment e = new Enrollment();
			e.setEnrollmentNo("");
			System.out.println("Returning empty enrollment: ");
			return e;
		}
		
	}
	
	public List<Enrollment> getCollegeEnrollmentsByStudentNo(String studentNo){
		String sql = "SELECT * FROM std_enrollments WHERE StudentNo = '"+ studentNo +"' "
				+ "ORDER BY SchoolYear, Semester ";

		
		return template.query(sql, new RowMapper<Enrollment>() {
			public Enrollment mapRow(ResultSet rs, int row) throws SQLException {
				Enrollment e = new Enrollment();
				e.setEnrollmentNo(rs.getString(1));
				e.setStudentNo(rs.getString(2));
				e.setSchoolYear(rs.getString(3));
				e.setSemester(rs.getInt(4));
				
				return e;
			}
		});
	}
	
	public List<Enrollment> getSHEnrollmentsByStudentNo(String studentNo){
		String sql = "SELECT * FROM shs_enrollments WHERE StudentNo = '"+ studentNo +"' "
				+ "ORDER BY SchoolYear, Semester ";

		
		return template.query(sql, new RowMapper<Enrollment>() {
			public Enrollment mapRow(ResultSet rs, int row) throws SQLException {
				Enrollment e = new Enrollment();
				e.setEnrollmentNo(rs.getString(1));
				e.setStudentNo(rs.getString(2));
				e.setSchoolYear(rs.getString(3));
				e.setSemester(rs.getInt(4));
				e.setSectionID(rs.getString(6));
				e.setStrandCode(rs.getString(7));
				e.setModifiedCount(rs.getInt(8));
				
				return e;
			}
		});
	}
	
	
	// Get Departments List
	public List<Department> getDepartments(String param) {
		String sql = "SELECT * FROM departments WHERE DepartmentCode LIKE '%" + param + "%' OR DepartmentName LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Department>() {
			public Department mapRow(ResultSet rs, int row) throws SQLException {
				Department d = new Department();
				d.setDepartmentCode(rs.getString(1));
				d.setDepartmentName(rs.getString(2));
				return d;
			}
		});
	}
	
	public List<Teacher> getPersonnels(String param) {
		String sql = "SELECT * FROM personnels WHERE PersonnelID LIKE '%" + param + "%' ";
		return template.query(sql, new RowMapper<Teacher>() {
			public Teacher mapRow(ResultSet rs, int row) throws SQLException {
				Teacher t = new Teacher();
				t.setPersonnelID(rs.getString(1));
				t.setFirstName(rs.getString(2));
				t.setMiddleName(rs.getString(3));
				t.setLastName(rs.getString(4));
				
				return t;
			}
		});
	}
	
}
