package edu.hrbeu.msc.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import edu.hrbeu.msc.dao.LoginDao;
import edu.hrbeu.msc.tools.VCodeGenerator;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String method = req.getParameter("method");

        if ("GetVCode".equalsIgnoreCase(method)) {
            getVCode(req, resp);
        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String method = req.getParameter("method");


        if ("Login".equals(method)) { //验证登录
            login(req, resp);
        }
    }


    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String msg = "";
        HttpSession hs = req.getSession();
        String userType = req.getParameter("login");
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        LoginDao loginDao = new LoginDao();

        String vcode = req.getParameter("vcode");
        String sVcode = (String) req.getSession().getAttribute("vcode");
        //System.out.println("lll");
        if (!sVcode.equalsIgnoreCase(vcode)) {//先判断验证码是否正确
            //System.out.println(vcode);
            //System.out.println(sVcode);
            //System.out.println(id);
            //System.out.println(password);

            msg = "vcodeError";
        } else {
            //System.out.println("1");

            if (userType.equals("admin")) {
                msg = "admin";
                //System.out.println("2");

                Map<String, String> tem = null;
                try {
                    tem = loginDao.setAdminSession(id, password, userType);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (tem == null) {
                    //req.getRequestDispatcher("login.jsp").forward(req, resp);
                    msg = "loginError";
                } else {
                    // System.out.println("hhh");
                    hs.setAttribute("userType", userType);
                    hs.setAttribute("id", id);
                    hs.setAttribute("password", password);
                    //System.out.println("ccc");
                    //req.getRequestDispatcher("admin_index.jsp").forward(req, resp);
                }
            } else if (userType.equals("teacher")) {
                msg = "teacher";
                Map<String, String> tem = null;
                try {
                    tem = loginDao.setTeacherSession(id, password, userType);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (tem == null) {
                    msg = "loginError";
                } else {
                    hs.setAttribute("userType", userType);
                    hs.setAttribute("id", id);
                    hs.setAttribute("password", password);
                    //req.getRequestDispatcher("teacher_index.jsp").forward(req, resp);
                }
            } else {
                Map<String, String> tem = null;
                msg = "student";
                try {
                    tem = loginDao.setStudentSession(id, password, userType);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (tem == null) {
                    msg = "loginError";
                } else {
                    hs.setAttribute("userType", userType);
                    hs.setAttribute("id", id);
                    hs.setAttribute("password", password);
                    //req.getRequestDispatcher("student_index.jsp").forward(req, resp);
                }
            }
            //System.out.println(msg);
            resp.getWriter().write(msg);

        }
    }

    //验证码
    private void getVCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //创建验证码生成器对象
        VCodeGenerator vcGenerator = new VCodeGenerator();
        //生成验证码
        String vcode = vcGenerator.generatorVCode();
        //将验证码保存在session域中,以便判断验证码是否正确
        request.getSession().setAttribute("vcode", vcode);
        //生成验证码图片
        BufferedImage vImg = vcGenerator.generatorRotateVCodeImage(vcode, true);
        //输出图像
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());

        encoder.encode(vImg);
    }
}




