
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

    <script src="js/jquery-3.5.1.js"></script>  
    <script src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/printLOGO.js"></script>
    <!-- 登陆网站更改头像用户名等... -->    
    <script type="text/javascript" src="js/loginChange.js"></script>
<%
    request.setCharacterEncoding("utf-8");
    String uuid = null; 
    Cookie cookie[] = request.getCookies();
             //获取用户uuid
     for(Cookie c:cookie){
         if("_uuid".equals(c.getName())){
             uuid = c.getValue();
             c.setMaxAge(0);
             response.addCookie(c);
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

    String uuid_string = uuid.toString();
    String sql = "delete from user where uuid='" + uuid_string + "'";

    ps = conn.prepareStatement(sql);
    row = ps.executeUpdate();

    

    if(row!=0){
        out.println("deleted.");
        
         
        response.sendRedirect("./index.jsp");
    }else{
        out.println("failed~");
        out.println(uuid_string);
    }
    conn.close();
%>
    
        
    
</body>
</html>
