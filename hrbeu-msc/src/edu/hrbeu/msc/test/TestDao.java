package edu.hrbeu.msc.test;

import java.sql.Date;
import java.util.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import edu.hrbeu.msc.dao.GradeDao;
import edu.hrbeu.msc.dao.StudentDao;
import edu.hrbeu.msc.entity.Student;

public class TestDao {


    public void testAddGradeDao() {
        Map<String, Object> grade = new HashMap<String, Object>();
        grade.put("stu_no", "123");
        grade.put("sub_no", "2011");
        grade.put("usual_grade", 100);
        grade.put("paper_grade", 100);
        grade.put("final_grade", 80);
        grade.put("comment", "bucuo");
        try {
            GradeDao gradeDao = new GradeDao();
            gradeDao.updateGrade(grade);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("wanbi");
    }


    public void testaaa() {
        GradeDao grade = new GradeDao();
		/*try{
			//System.out.println(grade.queryGrade("123", null));
		}catch(SQLException e ){
			e.printStackTrace();
		}*/
    }

    public void testStudent() throws ParseException {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = dateFormat.parse("2016-9-1");
        java.sql.Date sqldate = new java.sql.Date(date.getTime());
        Student stu = new Student();
        stu.setSex("��");
        stu.setStu_no("2016201101");
        stu.setStu_name("������");
        stu.setClazz("20162011");
        stu.setAdmissiontime(sqldate);
        stu.setDepartment("�������");
        stu.setMajor("�������");
        stu.setPassword("123");
        StudentDao stuDao = new StudentDao();
        List<Map<String, Object>> stuList = new LinkedList<Map<String, Object>>();
        List<Student> stu1 = new LinkedList<Student>();
        try {
            stu1 = stuDao.findStudentBysubNoOrTeNo(null, "2011");
            //System.out.println(stuDao.updatePassword("123", "123", "123456"));
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

