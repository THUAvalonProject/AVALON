<%@page import="java.sql.*"%>
<%@ page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>upload_user_info</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");//设置编码方式，防止中文乱码
    String uuid = null;

    Cookie cookie[] = request.getCookies();
            //获取用户uuid
    for(Cookie c:cookie){
        if("_uuid".equals(c.getName())){
            uuid = c.getValue();
        }
    } 
    
    int row = 0;

	Connection conn = null;
	PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/tmp?useSSL=false";
	String username = "root";
	String password = "root";
	conn = DriverManager.getConnection(url, username, password);
	
	
	String name = request.getParameter("name");
    String real_name = new String(request.getParameter("real_name").getBytes("ISO-8859-1"), "UTF-8"); 
    String grade = request.getParameter("grade");
    String number = request.getParameter("number");
    String department = request.getParameter("department");

    out.println(uuid);
    out.println(name);
    out.println(real_name);
    out.println(grade);
    out.println(number);
    out.println(department);

	try{
        String sql = "UPDATE user SET name=?, real_name=?, grade=?, stu_number=?, department=? where uuid=? ";
        ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, real_name);
        ps.setString(3, grade);
        ps.setString(4, number);
        ps.setString(5, department);

        ps.setString(6, uuid.toString());
        row = ps.executeUpdate();
        conn.commit();
    }catch(Exception e){
        out.println("failed");
        response.sendRedirect("./personalAccount.jsp");
    }

    
	//if (row > 0) {
	//	response.sendRedirect("./personalAccount.jsp");
	//}

    conn.close();
%>

</body>
</html>
