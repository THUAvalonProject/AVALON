
<!--
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
-->
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		
        <link rel="stylesheet" href="css/sample_01.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="shortcut icon" href="img/logo-white.ico"/>      
        
        <link rel="stylesheet" href="css/Labour.css">
        
        <script type="text/javascript"></script>
        
		<title>勞作教育-avalon</title>
		
		
		
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" οncοpy="return false">

		<!-- 禁止选中 -->
		<!-- <body oncontextmenu="return false"  onselectstart="return false"  ondragstart="return false" οncοpy="return false"> -->

		<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
		<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

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


		<!-- 頭部 -->
		<div class="header">
			<img src="img/logo%20黑白.png" alt="" onclick="window.location.href='index.jsp'" />



			<img class="user_head" src="img/用户.svg" alt="" onclick="clickAccount()" />

			<p class="user_name" onclick="clickAccount()"><% out.print(name); %></p>
		</div>

		<br />
		
		
		<div >
            <div class="page-container" style="min-height:349px;padding-top: 450px;">
    
                <!-- Page content -->
                    <div class="page-content">
                
                        <!-- Main content -->
                        <div class="content-wrapper">
                
                            <div class="panel panel-flat">
                
                    <div class="panel-body" id="contentprint"><div class="row" style="padding-left: 100px; padding-right: 100px;">
                    <h2 >基本勞作地點、成績</h2>
                    <ul class="nav nav-tabs" style="margin-bottom: 15px;">
                      <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">地點 Location</a></li>
                      <li class=""><a href="#score" data-toggle="tab" aria-expanded="false">成績 Score</a></li>
                    </ul>
                </div>
                <div id="myTabContent" class="tab-content" style="padding-left: 85px; padding-right: 115px;">
                    <div class="tab-pane fade active in" id="home">
                                <div id="no-more-tables">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr><th><small>期別<br>Section</small></th><th><small>起始日期<br>Staring Date</small></th><th><small>迄止日期<br>Ending Date</small></th><th><small>勞作地點<br>Location</small></th><th><small>集合地點<br>Meeting Place</small></th><th><small>時段<br>Time Period</small></th><th><small>小組長姓名<br>Name</small></th><th><small>小組長系級<br>Major</small></th><th><small>小組長電話<br>Phone</small></th></tr>
                                        </thead>
                                        <tbody>
                                        <tr><td data-title="期別<BR>Section">example</td>
                                            <td data-title="起日<BR>Starting Date">example</td>
                                            <td data-title="迄日<BR>Ending Date">example</td>
                                            <td data-title="地點<BR>Location">example</td>
                                            <td data-title="集合<BR>Meeting Place">example</td>
                                            <td data-title="時段<BR>Time Period">example</td>
                                            <td data-title="小組長<BR>Name">example</td>
                                            <td data-title="系級<BR>Major">example</td>
                                            <td data-title="電話<BR>Phone">example</td>
                                        </tr>
                                        <tr><td data-title="期別<BR>Section">1</td>
                                            <td data-title="起日<BR>Starting Date">12/01</td>
                                            <td data-title="迄日<BR>Ending Date">12/31</td>
                                            <td data-title="地點<BR>Location"><a href="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1819.8927811569324!2d120.59601181001378!3d24.179252152577927!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346915fe84ec9c95%3A0x7b8d45b7f8e09178!2z5p2x5rW35aSn5a245ZyW5pu46aSo!5e0!3m2!1szh-TW!2stw!4v1607050534150!5m2!1szh-TW!2stw" target="map">圖書館</a></td>
                                            <td data-title="集合<BR>Meeting Place">一樓服務台</td>
                                            <td data-title="時段<BR>Time Period">12:00-12:30</td>
                                            <td data-title="小組長<BR>Name">王大明</td>
                                            <td data-title="系級<BR>Major">某學系</td>
                                            <td data-title="電話<BR>Phone">0912345678</td>
                                        </tr>
                                        <tr>
                                            <td colspan="9">
                                                點擊勞作地點在下方顯示位置
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="9"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1819.875768845609!2d120.59743775794486!3d24.180445042968454!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34693e1c3a406707%3A0xd43d01bc4fb2806a!2z5p2x5rW35aSn5a24!5e0!3m2!1szh-TW!2stw!4v1607052677272!5m2!1szh-TW!2stw" name="map" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" style="padding-top: 5000px;"></iframe>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="9">
                                                校園平面圖: <a href="img/THU_CampusMap_20141124.jpg" target="_blank"> click here to open in new window</a>
                                            </td>
                                        </tr>
                                        
                                        </tbody>
                                    </table>
                                    
                                    
                                    <!--
                                    <iframe name="map" width="100%" height="auto">

                                    </iframe>
                                    -->
                        </div>
                            </div>
                    <div class="tab-pane fade" id="score" style="padding-bottom: 580px;">
                         <p class="well well-small">查無成績資料</p>
                	</div>
                </div>
                ﻿</div></div>
                </div>
                <!-- /main content -->
                
                </div>
                <!-- /page content -->
                
                
                <!-- Footer -->
                <div style="padding-left: 130px;">
                    © 2020 - Tunghai University 東海大學 	</div>
                <!-- /footer -->
                
                </div>
		</div>
		
		<div id="mask" onclick="hideLoginBox()"></div>
		<style>
			#mask{
				position: absolute;
				width: 100%;
				height: 100%;
				background-color:  #000000;
				opacity: 0.8;
				visibility: hidden
			}
		</style>
		<iframe align="center" width="400" height="481" src="login.html"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" class="modal-box" style="position: absolute;visibility: visible;"></iframe>
		<script>
			$('.modal-box').hide();
			function activeLoginBox(){
				document.getElementById('mask').style.visibility = 'visible';
				$('.modal-box').show();
			}
			function hideLoginBox(){
				document.getElementById('mask').style.visibility = 'hidden';
				$('.modal-box').hide();
			}
		</script>
		
		
	</body>
</html>
