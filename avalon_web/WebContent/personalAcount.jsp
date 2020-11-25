<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>個人賬號--avalon</title>
		
		<link rel="stylesheet" href="css/style_personalAcount.css">
		<link rel="shortcut icon" href="img/logo-white.ico" />
	</head>
	<body>
		<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
		<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		
		<script type="text/javascript" src="js/printLOGO.js"></script>
		<!-- 登陆网站更改头像用户名等... --!>
		
		<%
		    String uuid = null;
		    String name = null;
		    Cookie cookie[] = request.getCookies();
		    //获取用户uuid
		    for(Cookie c:cookie){
		        if("_uuid".equals(c.getName())){
		            uuid = c.getValue();
		        }
		    } 
		
		    Connection conn = null;
		    PreparedStatement ps = null;
		    
		    ResultSet rs_name = null;
		
		    Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://127.0.0.1:3306/tmp?useSSL=false";
		    String username = "root";
		    String password = "root";
		    conn = DriverManager.getConnection(url, username, password);
		    request.setCharacterEncoding("utf-8");
		
		    String name_String = "SELECT name FROM user WHERE uuid ='"+ uuid + "'";
		
		    ps = conn.prepareStatement(name_String);
		    rs_name = ps.executeQuery();
		    //name = "test";
		    while(rs_name.next()){
		        name = "test";
		        name = rs_name.getString(1);
		        
		    }
		%>
		
		<script type="text/javascript" src="js/loginChange.js"></script>
		
		
		<!-- 頭部 -->
		<div class="header">
			<img src="img/logo%20黑白.png" alt="" onclick="window.open(index.jsp)"/>
		
		
		
			<img class="user_head" src="img/用户.svg" alt="" onclick="" />
		
			<p class="user_name" onclick=""><% out.print(name); %></p>
		</div>
		

		<div class="list">
			<ul>
				<li>基本信息</li>
				<li>賬號安全</li>
				<li>其他選項</li>

			</ul>

		</div>
		
		<div>
			<button onclick="logOut()">退出当前账号</button>
			
		</div>
	</body>
</html>
