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
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.benedicto.mis.beans.containers.*;
import com.mysql.jdbc.exceptions.MySQLDataException;

public class studentdb {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	// public int createSPR(Student s) {
	// try {
	// String sql="insert into std_pinfo(StudentNo, FirstName, MiddleName, LastName,
	// Gender, BirthDate, BirthPlace) "
	// +"values(?,?,?,?,?,?,?)";
	// template.update(sql, null, s.getFirstName(), s.getMiddleName(),
	// s.getLastName(), s.getGender(), s.getBirthDate(), s.getBirthPlace());
	// int studentNo = template.queryForObject("select last_insert_id() As
	// studentNo" , Integer.class);
	// return studentNo;
	//
	//
	// }catch(Exception ex) {
	// ex.printStackTrace();
	// }
	// return 0;
	// }
	public int createSPR(Student s) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		final String sql = "insert into std_pinfo "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		final Student _s = s;
		
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
	
	

	public int createCourse(Course c) {
		String sql = "insert into clg_courses(CourseID, CourseDesc, DepartmentCode) " + "values(?,?,?)";
		return template.update(sql, c.getCourseID(), c.getCourseDesc(), c.getDepartmentCode());
	}

	public int createSubject(Subject s) {
		String sql = "insert into clg_subjects(SubjectCode, SubjectDesc, LecUnits, LabUnits) " + "values(?,?,?,?)";
		return template.update(sql, s.getSubjectCode(), s.getSubjectDesc(), s.getLecUnits(), s.getLabUnits());
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

	public int updateSPR(Student s) {
		String sql = "update std_pinfo set FirstName= ? , MiddleName= ?, LastName = ?, Gender = ?, "
				+ 			"BirthDate = ?, BirthPlace = ?, EmailAddress = ?, TelephoneNo = ?, ContactNo = ?, "
				+ 			"CityAddress = ?, Region = ?, ProvincialAddress = ?, Country = ?, Citizenship = ?, "
				+ 			"Religion = ?, MaritalStatus = ?, APR = ?, Working = ?, WorkingAddress = ?    WHERE StudentNo = ? ";
		
		//return template.update(sql, s.getFirstName(), s.getMiddleName(), s.getLastName(), s.getGender(),
		//		s.getBirthDate(), s.getBirthPlace(), s.getStudentID());
		final Student _s = s;
		
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
				+ "S_Name= ? , S_ContactNo=?  WHERE StudentNo=?";
				
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

	public Student getStudentByNo(String studentNo) {
		String sql = "select * from std_pinfo where StudentNo=?";
		return template.queryForObject(sql, new Object[] { studentNo },
				new BeanPropertyRowMapper<Student>(Student.class));
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

	public Subject getSubjectByCode(String subjCode) {
		String sql = "select * from clg_subjects where SubjectCode=?";
		return template.queryForObject(sql, new Object[] { subjCode },
				new BeanPropertyRowMapper<Subject>(Subject.class));
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

	public List<Student> getAllStudents(String param, String ID) {
		// String sql = "SELECT * from Student WHERE StudentID LIKE '%"+ param +"%' OR
		// FirstName LIKE '%"+ param +"%' OR LastName LIKE '%"+ param +"%' ";
		String sql = "SELECT clg_profiles.StudentID, shs_profiles.LRN, bsc_profiles.LRN, std_pinfo.* "
				+ "FROM std_pinfo LEFT JOIN clg_profiles ON std_pinfo.StudentNo = clg_profiles.StudentNo "
				+ "LEFT JOIN shs_profiles ON std_pinfo.StudentNo = shs_profiles.StudentNo "
				+ "LEFT JOIN bsc_profiles ON std_pinfo.StudentNo = bsc_profiles.StudentNo "
				+ "WHERE (clg_profiles.StudentID LIKE '%" + param + "%' OR shs_profiles.LRN LIKE '%" + ID
				+ "%' OR std_pinfo.FirstName LIKE '%" + param + "%' OR std_pinfo.LastName LIKE '%" + param + "%') ORDER BY std_pinfo.LastName ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				String studentID = "";
				String LRNshs = "";
				String LRNbsc = "";
				String theID = "";

				try {
					studentID = rs.getObject(1).toString();
				} catch (Exception ex) {
					studentID = "";
				}

				try {
					LRNshs = rs.getObject(2).toString();
				} catch (Exception ex) {
					LRNshs = "";
				}

				try {
					LRNbsc = rs.getObject(3).toString();
				} catch (Exception ex) {
					LRNbsc = "";
				}

				if (studentID.equals("")) {
					if (LRNshs.equals("")) {
						theID = LRNbsc;
					} else {
						theID = LRNshs;
					}
				} else {
					theID = studentID;
				}
				s.setStudentNo(rs.getString(4));
				s.setStudentID(theID);
				s.setFirstName(rs.getString(5));
				s.setMiddleName(rs.getString(6));
				s.setLastName(rs.getString(7));
				return s;
			}
		});
	}

	// Get Students List
	public List<Student> getCollegeStudents(String param, String courseID) {
		// String sql = "SELECT * from Student WHERE StudentID LIKE '%"+ param +"%' OR
		// FirstName LIKE '%"+ param +"%' OR LastName LIKE '%"+ param +"%' ";
		String sql = "SELECT  clg_profiles.StudentID , clg_profiles.CourseID , std_pinfo.* "
				+ "FROM std_pinfo INNER JOIN clg_profiles ON std_pinfo.StudentNo = clg_profiles.StudentNo "
				+ "WHERE (clg_profiles.StudentID LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND clg_profiles.CourseID LIKE '%" + courseID
				+ "%'  ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				s.setStudentNo(rs.getString(3));
				s.setStudentID(rs.getString(1));
				s.setFirstName(rs.getString(4));
				s.setMiddleName(rs.getString(5));
				s.setLastName(rs.getString(6));
				return s;
			}
		});
	}

	// Get SH Students List
	public List<Student> getSHStudents(String param, String strandCode) {
		// String sql = "SELECT * from Student WHERE StudentID LIKE '%"+ param +"%' OR
		// FirstName LIKE '%"+ param +"%' OR LastName LIKE '%"+ param +"%' ";
		String sql = "SELECT shs_profiles.LRN,shs_profiles.StrandCode, std_pinfo.* "
				+ "FROM std_pinfo INNER JOIN shs_profiles ON std_pinfo.StudentNo = shs_profiles.StudentNo "
				+ "WHERE (shs_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND shs_profiles.StrandCode LIKE '%"
				+ strandCode + "%'  ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				s.setStudentNo(rs.getString(3));
				s.setStudentID(rs.getString(1));
				s.setFirstName(rs.getString(4));
				s.setMiddleName(rs.getString(5));
				s.setLastName(rs.getString(6));
				return s;
			}
		});
	}

	public List<Student> getBSCStudents(String param) {
		// String sql = "SELECT * from Student WHERE StudentID LIKE '%"+ param +"%' OR
		// FirstName LIKE '%"+ param +"%' OR LastName LIKE '%"+ param +"%' ";
		String sql = "SELECT bsc_profiles.LRN, std_pinfo.* "
				+ "FROM std_pinfo INNER JOIN bsc_profiles ON std_pinfo.StudentNo = bsc_profiles.StudentNo "
				+ "WHERE (bsc_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				s.setStudentID(rs.getString(1));
				s.setStudentNo(rs.getString(2));
				s.setFirstName(rs.getString(3));
				s.setMiddleName(rs.getString(4));
				s.setLastName(rs.getString(5));
				return s;
			}
		});
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
		return template.queryForObject(sql, new Object[] { courseID }, new BeanPropertyRowMapper<Course>(Course.class));
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

	public List<Student> getSHStudentsBySection(String sectionID, String param, String year, int sem) {
		String sql = "SELECT shs_secstudents.SectionID,shs_profiles.LRN,  std_pinfo.*, enrollments.SchoolYear, enrollments.Semester "
				+ "FROM shs_secstudents INNER JOIN shs_profiles ON shs_secstudents.StudentNo = shs_profiles.StudentNo "
				+ "INNER JOIN std_pinfo ON shs_secstudents.StudentNo = std_pinfo.StudentNo "
				+ "INNER JOIN enrollments ON shs_secstudents.StudentNo = enrollments.StudentNo "
				+ "WHERE (shs_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND shs_secstudents.SectionID = '" + sectionID
				+ "' AND enrollments.SchoolYear = '" + year + "' AND enrollments.Semester = '" + sem + "'   ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				s.setStudentID(rs.getString(2));
				s.setFirstName(rs.getString(5));
				s.setMiddleName(rs.getString(6));
				s.setLastName(rs.getString(7));
				return s;
			}
		});
	}

	public List<Student> getBSCStudentsBySection(String sectionID, String param, String year, int sem) {
		String sql = "SELECT bsc_secstudents.SectionID,bsc_profiles.LRN,  std_pinfo.*, enrollments.SchoolYear, enrollments.Semester "
				+ "FROM bsc_secstudents INNER JOIN bsc_profiles ON bsc_secstudents.StudentNo = bsc_profiles.StudentNo "
				+ "INNER JOIN std_pinfo ON bsc_secstudents.StudentNo = std_pinfo.StudentNo "
				+ "INNER JOIN enrollments ON bsc_secstudents.StudentNo = enrollments.StudentNo "
				+ "WHERE (bsc_profiles.LRN LIKE '%" + param + "%' OR std_pinfo.FirstName LIKE '%" + param
				+ "%' OR std_pinfo.LastName LIKE '%" + param + "%') " + "AND bsc_secstudents.SectionID = '" + sectionID
				+ "' AND enrollments.SchoolYear = '" + year + "' AND enrollments.Semester = '" + sem + "'   ";

		return template.query(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = new Student();
				s.setStudentID(rs.getString(2));
				s.setFirstName(rs.getString(5));
				s.setMiddleName(rs.getString(6));
				s.setLastName(rs.getString(7));
				return s;
			}
		});
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

	// Get Subjects List
	public List<Subject> getSubjects(String param) {
		String sql = "SELECT * FROM clg_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int row) throws SQLException {
				Subject s = new Subject();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setLabUnits(rs.getInt(3));
				s.setLecUnits(rs.getInt(4));
				return s;
			}
		});
	}

	// Get Subjects List
	public List<SubjectSHS> getSHSubjects(String param) {
		String sql = "SELECT * FROM shs_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<SubjectSHS>() {
			public SubjectSHS mapRow(ResultSet rs, int row) throws SQLException {
				SubjectSHS s = new SubjectSHS();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setPreRequisites(rs.getString(3));
				s.setType(rs.getString(4));
				return s;
			}
		});
	}

	public List<SubjectSHS> getBSCSubjects(String param) {
		String sql = "SELECT * FROM bsc_subjects WHERE SubjectCode LIKE '%" + param + "%' OR SubjectDesc LIKE '%"
				+ param + "%' ";
		return template.query(sql, new RowMapper<SubjectSHS>() {
			public SubjectSHS mapRow(ResultSet rs, int row) throws SQLException {
				SubjectSHS s = new SubjectSHS();
				s.setSubjectCode(rs.getString(1));
				s.setSubjectDesc(rs.getString(2));
				s.setPreRequisites(rs.getString(3));
				s.setType(rs.getString(4));
				return s;
			}
		});
	}

	// Get Curriculum
	public Curriculum getCurriculumByID(String id) {
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
		String sql = "SELECT * FROM clg_curriculum WHERE CourseID = ? ORDER BY CurriculumID DESC LIMIT 1";
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
				SubjectSHS subject = new SubjectSHS();

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

	// enroll Student
	public int enrollStudentToCurrentSem(Student S) {
		StudentProfile studCAB = this.getCollegeProfileByNo(S.getStudentNo());
		String sql = "INSERT INTO enrollment(StudentID, SchoolYear, Semester, CurriculumID) " + "VALUES(?,?,?,?)";
		return template.update(sql, S.getStudentID(), "2017-2018", 1, studCAB.getCurriculumID());
	}

	public int saveCurriculumSubjects(String curricID, String subjectCode, int year, int sem) {
		String sql = "insert into clg_syllabus " + "values(?,?,?,?,?)";
		return template.update(sql, curricID, subjectCode, year, sem, 0);
	}

	// enlist Student Subjects
	public int enlistCollegeStudentSchedules(String StudentNo, String ScheduleID) {
		String sql = "insert into clg_enlistments(StudentNo, ScheduleID) " + "values(?,?)";
		return template.update(sql, StudentNo, ScheduleID);
	}

	// unenlist Student Subjects
	public int withdrawStudentSubjects(String StudentNo, String ScheduleID) {
		String sql = "DELETE FROM clg_enlistments WHERE StudentNo = ? AND ScheduleID = ?";
		return template.update(sql, StudentNo, ScheduleID);
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

	// Get Student Subject Grades
	public List<SubjectGrades> getStudentGrades(String StudentID) {
		String sql = "SELECT e.StudentID, sc.SubjectCode, su.SubjectDesc, su.LecUnits, su.LabUnits, "
				+ "g.Prelim, g.Midterm, g.Final, g.GradeEquivalent, g.DateModified, sc.SchoolYear, sc.Semester "
				+ "FROM clg_enlistments AS e INNER JOIN  clg_schedules AS sc ON e.ScheduleID = sc.ScheduleID "
				+ "INNER JOIN subject AS su ON sc.SubjectCode = su.SubjectCode "
				+ "INNER JOIN grades AS g ON e.clg_enlistmentsID = g.clg_enlistmentsID " + "WHERE e.StudentID = '"
				+ StudentID + "'  ORDER BY sc.SchoolYear, sc.Semester ";
		try {
			return template.query(sql, new RowMapper<SubjectGrades>() {
				public SubjectGrades mapRow(ResultSet rs, int row) throws SQLException {
					SubjectGrades s = new SubjectGrades();
					s.setSubjectCode(rs.getString(2));
					s.setSubjectDesc(rs.getString(3));
					s.setLecUnits(rs.getInt(4));
					s.setLabUnits(rs.getInt(5));
					s.setPrelimGrade(rs.getFloat(6));
					s.setMidtermGrade(rs.getFloat(7));
					s.setFinalGrade(rs.getFloat(8));
					s.setEquivalentGrade(rs.getFloat(9));
					s.setDateModified(rs.getString(10));
					s.setSchoolYear(rs.getString(11));
					s.setSemester(rs.getString(12));
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
