<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="utf-8" />

    <link rel="stylesheet" href="css/sample_01.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="shortcut icon" href="img/logo-white.ico" />
    <link rel="stylesheet" href="css/style_ClassSchedule.css">
    <script type="text/javascript"></script>

    <title>學生課表</title>

    <style>
        #myMenu {
            width: 200px;
            height: 80px;
            background: white;
            display: none;
            position: absolute;
            /* border: 1px solid #EED5D2; */
            z-index: 999
			
        }
        
        #myMenu ul {
            list-style: none;
        }
        
        #myMenu ul li {
            width: 200px;
            height: 40px;
			line-height: 40px;
            background: #000000;
			color: white;
            /* margin-bottom: 5px; */
            text-align: center;
			opacity: 0.8;
            /* margin-left: -25px */
        }
		
		#myMenu ul li:hover{
			opacity: 1;
			
			
		}
        
        #myDiv {
            border: 1px solid red;
            width: 100px;
            height: 100px;
            display: block;
            margin: 200px auto;
        }
    </style>

    





</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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


	<script>
	    //滑鼠右鍵預設選單事件
	    
	        //點選頁面任意區域，隱藏自定義選單
		$("#element").ready(function() {  //等待載入完成
			$("button").mousedown(function(ev){ //僅在button物件才能彈出選單
				console.log(ev.button);
				if(ev.button == 2){
					var oevent = ev || event;
					var myMenu = document.getElementById('myMenu');
					//彈出自定義選單
					myMenu.style.display = 'block';
					//設定自定義選單的座標，達到滑鼠右鍵的地方彈出自定義選單
					myMenu.style.left = oevent.pageX + 'px';
					myMenu.style.top = oevent.pageY + 'px';
						
					//禁用右鍵預設選單
					return false;
				}
			});
			
			
		});
		
			
			
	    document.onclick = function() {
	            var myMenu = document.getElementById('myMenu');
	            myMenu.style.display = 'none';
	        }
	        //顯示div
	    function xianshi() {
	        //var myDiv = document.getElementById('myDiv');
	        myDiv.style.display = "block";
	    }
		
	    //隱藏div
	    function yc() {
	        //var myDiv = document.getElementById('myDiv');
	        myDiv.style.display = "none";
	    }
	</script>	
	
	
    <body>
        <!-- jQ -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script> -->
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
	    
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

        <div class="header">
        	<img src="img/logo%20黑白.png" alt="" onclick="window.location.href='index.jsp'"/>
        
        
        
        	<img class="user_head" src="img/用户.svg" alt="" onclick="clickAccount()" />
        
        	<p class="user_name" onclick="clickAccount()"><% out.print(name); %></p>
        </div>

        <div id="myMenu">
            <ul>
                <!-- <li onclick="xianshi();">顯示</li>
                <li onclick="yc();">隱藏</li> -->
                <li>新增課程</li>
                <li>新增行程</li>
                <li>更改</li>
                <li>刪除</li>
                <li>查詢課程</li>
            </ul>
        </div>

        <div class="schedule">

            <div class="row">

                <div>
                    <table class="table table-hover" class="table-responsive" style="margin-top:10px;">


                        <thead>
                            <tr>
                                <th>節次\星期</th>
                                <th>星期一</th>
                                <th>星期二</th>
                                <th>星期三</th>
                                <th>星期四</th>
                                <th>星期五</th>
                                <th>星期六</th>
                                <th>星期日</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>0<br>07:10-08:00</th>
                                <td><button id="item" class="dropbtn" onclick="xianshi();"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>1<br>08:10-09:00</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>2<br>09:10-10:00</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>3<br>10:20-11:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>4<br>11:20-12:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>4.5<br>12:10-13:00</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>5<br>13:10-14:00</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>6<br>14:10-15:00</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>7<br>15:20-16:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>8<br>16:20-17:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>9<br>17:20-18:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>10<br>18:20-19:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>11<br>19:20-20:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th>12<br>20:20-21:10</th>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                                <td><button id="item" class="dropbtn"></button></td>
                            </tr>
                        </tbody>


                    </table>
                </div>


                <!-- <div id="myDiv">我是內容</div> -->

            </div>
        </div>

    </body>

</html>
