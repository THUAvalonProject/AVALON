<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">

	<head>
		<meta charset="utf-8" />

		<link rel="stylesheet" href="css/style_index.css">
		<link rel="shortcut icon" href="img/logo-white.ico" />

		<title>AVALON學生系統--東海大學</title>
		
		<meta name="author" content="author: army_red - 吃小米长大的枪" />
		<meta name="generator" content="VScode / HBuilder" />
		<meta name="keywords" content="HTML,JSP,SQL">

	</head>

	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" οncοpy="return false">

		<!-- 禁止选中 -->
		<!-- <body oncontextmenu="return false"  onselectstart="return false"  ondragstart="return false" οncοpy="return false"> -->

		<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
		<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		<script src="js/jquery-3.5.1.js"></script>
        <script src="js/slick.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
        <script>
            const options = { //自定義
                bottom: '32px', // default: '32px'
                right: '32px', // default: '32px'
                left: 'unset', // default: 'unset'
                time: '0.5s', // default: '0.3s'
                mixColor: '#fff', // default: '#fff'
                backgroundColor: '#fff',  // default: '#fff'
                buttonColorDark: '#100f2c',  // default: '#100f2c'
                buttonColorLight: '#fff', // default: '#fff'
                saveInCookies: false, // default: true,
                label: '🌓', // default: ''
                autoMatchOsTheme: true // default: true
            }

            const darkmode = new Darkmode(options);
            darkmode.showWidget();

            // function addDarkmodeWidget() { //預設
            //     new Darkmode().showWidget();
            // }
            window.addEventListener('load', addDarkmodeWidget);
        </script>
        <script>
            var flag = 0;
            $(".darkmode-toggle").click(function(){
                if(flag==0){
                    $(".header img").css("filter", "invert(100%)");
                    flag=1;
                }
                else{
                    $(".header img").css("filter", "invert(0%)");
                    flag=0;
                }
            })
        </script>

		<script type="text/javascript" src="js/printLOGO.js"></script>
		<!-- 登陆网站更改头像用户名等... -->
		
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
			<img src="img/logo%20黑白.png" alt="" />



			<img class="user_head" src="img/用户.svg" alt="" onclick="clickAccount()" />

			<p class="user_name" onclick="clickAccount()"><% out.print(name); %></p>
		</div>

		<br />


		<div class="body">
			<!-- 所有圖標的大盒子 -->
			<div class="container">
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img" onclick="window.open('SkimHomework.jsp')">
						<img src="img/liebiao.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>作業瀏覽</p>

				</div>

				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/wenda.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>學生論壇</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img" onclick="window.open('Class-Schedule.jsp')">
						<img src="img/xuanzeqi.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>課表</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img" onclick="window.open('https://course.thu.edu.tw/index')">
						<img src="img/zhediemianban.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>課堂資料</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img" onclick="window.open('Labour.jsp')">
						<img src="img/扫把.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>勞作教育</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/shuxingjiegou.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>選課</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/ico_bb_sx_bq.png" alt="" onclick="window.open('News.jsp')"/>
					</div>

					<!-- 圖標名字 -->
					<p>學生資訊</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/mianban.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>其他</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/ball.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>校園新聞</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img" onclick="window.open('https://ilearn.thu.edu.tw')">
						<img src="img/tronclass.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>ilearn</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/pinglun.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>校園資訊</p>

				</div>
				<!-- 每個圖標的小盒子 -->
				<div class="box">
					<!-- 放圖標的小盒子 -->
					<div class="img">
						<img src="img/zhifu.png" alt="" />
					</div>

					<!-- 圖標名字 -->
					<p>贊助</p>

				</div>



			</div>

		</div>

		<!-- 曾经的登陆弹窗 -->
		<!-- <div id="mask" onclick="hideLoginBox()"></div>
        <style>
            #mask {
                position: absolute;
                width: 100%;
                height: 100%;
                background-color: #000000;
                opacity: 0.8;
                visibility: hidden
            }
        </style>
        <iframe align="center" width="400" height="481" src="login.jsp" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" class="modal-box" style="position: absolute;visibility: visible;"></iframe>
        <script>
            $('.modal-box').hide();

            function activeLoginBox() {
                document.getElementById('mask').style.visibility = 'visible';
                $('.modal-box').show();
            }

            function hideLoginBox() {
                document.getElementById('mask').style.visibility = 'hidden';
                $('.modal-box').hide();
            }
        </script> -->


	</body>

</html>
