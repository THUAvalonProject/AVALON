<%@page import="java.sql.*"%>
<%@ page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>upload_user_account</title>
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
    String pwd = request.getParameter("pwd");
    String ilearn_acc = request.getParameter("ilearn_acc");
    String ilearn_pwd = request.getParameter("ilearn_pwd");
    String new_acc = request.getParameter("new_acc");
    String new_pwd = request.getParameter("new_pwd");


	try{
        String sql = "UPDATE user SET name=?, pwd=?, ilearn_acc=?, ilearn_pwd=?, new_acc=?, new_pwd=? where uuid=? ";
        ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, pwd);
        ps.setString(3, ilearn_acc);
        ps.setString(4, ilearn_pwd);
        ps.setString(5, new_acc);
        ps.setString(6, new_pwd);

        ps.setString(7, uuid.toString());
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
