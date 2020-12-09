<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>check login</title>
</head>
<body>
	<%	
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs_uuid = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/tmp?useSSL=false";
		String username = "root";
		String password = "root";
		conn = DriverManager.getConnection(url, username, password);
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		

		String sql = "SELECT *FROM user WHERE name ='" + name + "'AND pwd = '" + pwd + "'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if (rs.next()) {
			//清除以前的cookie
			Cookie cookieToDelete[] = request.getCookies();
			for(int i=0;i<cookieToDelete.length;i++){  

    			cookieToDelete[i].setMaxAge(0);  

    			response.addCookie(cookieToDelete[i]);  

			} 
			
			
			//Cookie cookie_name = new Cookie("username",name);
			String uuid_String = "SELECT uuid FROM user WHERE name ='"+ name + "' AND pwd = '" + pwd + "'";
			
			rs_uuid = ps.executeQuery(uuid_String);

			while(rs_uuid.next()){
				Cookie uuid = new Cookie("_uuid", rs_uuid.getString(1));

				uuid.setMaxAge(60*60*24);

				response.addCookie(uuid);
			}

			response.sendRedirect("./index.jsp");
			
		}else{
			response.sendRedirect("./login.jsp");

		}
	%>

</body>
</html>


