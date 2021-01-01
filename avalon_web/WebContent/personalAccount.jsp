<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>個人賬號--avalon</title>

		<link rel="stylesheet" href="css/style_personalAccount.css">
		<link rel="shortcut icon" href="img/logo-white.ico" />
	</head>

	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" οncοpy="return false">
		<script src="js/jquery-3.5.1.js"></script>

		<script src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/printLOGO.js"></script>
		<!-- 登陆网站更改头像用户名等... -->

		<script type="text/javascript" src="js/loginChange.js"></script>
		
		<script>
			
			$("#element").ready(function() {  //等待載入完成
				
			//开始只显示info box
				$(".box").each(function(){
					//console.log($(this).attr('id'));
					if($(this).attr('id') == "info"){
						$(this).show();
					}else{
						$(this).hide();
					}
				})
			
				$(".click").click(function(){
					//console.log($(this).attr('id'));
					var id = $(this).attr('id');
					$(".box").each(function(){
						//console.log($(this).attr('id'));
						if($(this).attr('id') == id){
							$(this).show(500);
						}else{
							$(this).hide(500);
						}
					})
					
					//console.log($(".body").find("#info").attr("class"));
					
				});
				
				$("img").click(function(){
					//console.log($(this).attr('id'));
					var id = $(this).attr('id');
					if(id == "ilearn_pwd_action"){
						
						if($(this).attr('class') == "invisible" ){
							$(this).attr('src', "img/visible.svg");
							
							$(this).addClass("visible"); 
							$(this).removeClass("invisible");
							
							
							$("#ilearn_pwd").attr("type" , "text");
							//console.log("invisible");
						}else{
							$(this).attr('src', "img/invisible.svg");
							
							$(this).removeClass("visible");
							$(this).addClass("invisible"); 
							
							$("#ilearn_pwd").attr("type" , "password");
							//console.log("visible");
						}
					}
					
					if(id == "new_pwd_action"){
						
						if($(this).attr('class') == "invisible" ){
							$(this).attr('src', "img/visible.svg");
							
							$(this).addClass("visible"); 
							$(this).removeClass("invisible");
							
							
							$("#new_pwd").attr("type" , "text");
							//console.log("invisible");
						}else{
							$(this).attr('src', "img/invisible.svg");
							
							$(this).removeClass("visible");
							$(this).addClass("invisible"); 
							
							$("#new_pwd").attr("type" , "password");
							//console.log("visible");
						}
						
					}
					
					if(id == "pwd_action"){
						
						if($(this).attr('class') == "invisible" ){
							$(this).attr('src', "img/visible.svg");
							
							$(this).addClass("visible"); 
							$(this).removeClass("invisible");
							
							
							$("#pwd").attr("type" , "text");
							//console.log("invisible");
						}else{
							$(this).attr('src', "img/invisible.svg");
							
							$(this).removeClass("visible");
							$(this).addClass("invisible"); 
							
							$("#pwd").attr("type" , "password");
							//console.log("visible");
						}
						
					}
				});
			});
					
					
			
		</script>
		<%
			response.setContentType("text/html;charset=utf-8");
		    
			String uuid = null;
		    String name = null;
			String pwd = null;
			String real_name = null;
			String grade = null;
			String number = null;
			String department = null;

			String ilearn_acc = null;
			String ilearn_pwd = null;
			String new_acc = null;
			String new_pwd = null;

		    Cookie cookie[] = request.getCookies();
		    //获取用户uuid
		    for(Cookie c:cookie){
		        if("_uuid".equals(c.getName())){
		            uuid = c.getValue();
		        }
		    } 
		
		    Connection conn = null;
		    Statement stmt = null;  
		    
		    ResultSet rs = null;
		
		    Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://127.0.0.1:3306/tmp?useSSL=false";
		    String username = "root";
		    String password = "root";
		    conn = DriverManager.getConnection(url, username, password);
		    request.setCharacterEncoding("utf-8");
		
		    String sql = "SELECT * FROM user WHERE uuid ='"+ uuid + "'";
		
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql);
		    //name = "test";
		    while(rs.next()){
		        name = rs.getString("name");
				pwd = rs.getString("pwd");
		        real_name = rs.getString("real_name");
				grade = rs.getString("grade");
				number = rs.getString("stu_number");
				department = rs.getString("department");
				ilearn_acc = rs.getString("ilearn_acc");
				ilearn_pwd = rs.getString("ilearn_pwd");
				new_acc = rs.getString("new_acc");
				new_pwd = rs.getString("new_pwd");
		    }

		%>
		<!-- 頭部 -->
		<div class="header">
			<img src="img/logo%20黑白.png" alt="" onclick="window.open(index.jsp)" />



			<img class="user_head" src="img/用户.svg" alt="" onclick="" />

			<p class="user_name" onclick="">
				<% out.print(name); %>
			</p>
		</div>


		<div class="nav-list">
			<ul>
				<li  class="click" id="info"><a>基本信息</a></li>
				<li  class="click" id="safe"><a>賬號安全</a></li>
				<li  class="click" id="other"><a>其他選項</a></li>

			</ul>

		</div>
		
		
		<%-- 输入中文会出现？？？的bug --%>

		<div class="body">
			
			<div class="box" style="z-index: 10;" id="info"> 
				
				<div class="img">
					
					<img src="img/abaaba.jpg" style="z-index: 11;"/>
					<!-- 更換圖片 從數據庫讀取！！ -->
					<div style="z-index: 13;" class="cover"> 暫不支持更換頭像 </div>

					<%-- <input id="img_input" type="file" style="z-index: 13;" /> --%>
					
				</div>
				
				<form action="upload_user_info.jsp" method="POST" name="user_info" class="user_info" οnsubmit="document.charset='UTF-8'" accept-charset="utf-8">
					<p> 暱稱 ： <input name="name" type="text" disabled="" value="<% out.print(name); %>" /></p>
					<p> 姓名 ： <input name="real_name" type="text" disabled="" value="<% out.print(real_name); %>" ></p>
					<p> 年級 ： <input name="grade" type="text" disabled="" value="<% out.print(grade); %>" /></p>
					<p> 學生號碼 ： <input name="number" type="text" disabled="" value="<% out.print(number); %>" /></p>
					
					<p> 系級 ： 
						<select name="department" value="<% out.print(department); %>" class="selector" disabled="">
						  <option value="軟工">軟工</option>
						  <option value="數創">數創</option>
						  <option value="資電">資電</option>
						  <option value="AI">AI</option>
						</select>
					</p>
					
					<button class="edit" type="button" onclick="edit_user_info()">編輯</button>
					<button type="submit" onclick="return check_user_info()">提交</button>
				</form>
				
				<script>
					$("#element").ready(function() {

						$(".selector").val("<% out.print(department); %>");
					});
					// 按钮点击可以编辑input内容


					function edit_user_info(){
						console.log("edit");
						$(".user_info").find("input").attr("disabled",false);
						$(".user_info").find("select").attr("disabled",false);
					}
					
					function edit_user_acc(){
						console.log("edit");
						$(".user_account").find("input").attr("disabled",false);
						$(".user_info").find("select").attr("disabled",false);
					}

					function check_user_info() {
						var name = user_info.name.value;
						var real_name = user_info.real_name.value;
						var grade = user_info.grade.value;
						var number = user_info.number.value;
						var department = user_info.department.value;

						console.log(name + pwd);
						if (name == "" || name == null) {
							alert("请输入用户名");
							user_info.name.focus();
							return false;
						} else if (!/^\d{1,}$/.test(grade)) {
							alert("年級錯誤");
							user_info.grade.focus();
							return false;
						}
					return true;
				}
				</script>
				
				
			</div>
			
			
			
			
			
			
			
			<div class="box" style="z-index: 20;" id="safe">
				<h3> 賬號綁定 </h3>
				
				
				<p></p>
				<p></p>
				
				
				<form action="upload_user_account.jsp" method="POST" name="user_account" class="user_account">
					<h4> Avalon </h4>
					<p> 賬號 ： <input name="name" type="text" disabled="" value="<% out.print(name); %>"/></p>
					<p> 密碼 ： 
						<input name="pwd" id="pwd" type="password" disabled="" value="<% out.print(pwd); %>" maxlength="24"/>
						<img class="invisible" id="pwd_action" src="img/invisible.svg">
					</p>
					
					
					<p></p>
					<p></p>

					<h4> Ilearn </h4>
					<p> 賬號 ： <input name="ilearn_acc" type="text" disabled="" value="<% out.print(ilearn_acc); %>"/></p>
					<p> 密碼 ： 
						<input name="ilearn_pwd" id="ilearn_pwd" type="password" disabled="" value="<% out.print(ilearn_pwd); %>" maxlength="24"/>
						<img class="invisible" id="ilearn_pwd_action" src="img/invisible.svg">
					</p>
					
					
					<p></p>
					<p></p>
					
					
					<h4> 新版教學平台 </h4>
					<p> 賬號 ： <input name="new_acc" type="text" disabled="" value="<% out.print(new_acc); %>" /></p>
					<p> 密碼 ： 
						<input name="new_pwd" id="new_pwd" type="password" disabled="" value="<% out.print(new_pwd); %>" maxlength="24"/>
						<img class="invisible" id="new_pwd_action" src="img/invisible.svg">
					
					</p>

					
					
					
					<button class="edit" type="button" onclick="edit_user_acc()">編輯</button>
					<button type="submit" onclick="return check_user_info()">提交</button>

					<p> 賬號密碼若為null說明不存在，請填寫賬號密碼 </p>
				</form>
			
			</div>
			
			
			
			
			
			
			
			
			
			
			
			<div class="box" style="z-index: 30;" id="other">
				
				<button onclick="logOut()">退出当前账号</button>

				
				<div class="innerbox">
					<p>慎重選擇</p>
					<button id="Btn"  action="delete.jsp" class="delete_acc">註銷賬戶</button>
					<%-- <button class="delete_acc" onclick="return ">重置賬戶信息</button> --%>

					<!-- 弹窗 -->
					<div id="Modal" class="modal">

					  <!-- 弹窗内容 -->
					  <div class="modal-content">
					    <form action="delete.jsp">
							<span class="close">&times;</span>
					    	<p>註銷的賬戶將無法找回，確認嗎？</p>
							<button type="submit">確認</button>
							<button onclick="modal.style.display = 'none';">取消</button>
						
						</form>
					  </div>
 
					</div>

					<style>
						/* 弹窗 (background) */
						.modal {
						    display: none; /* 默认隐藏 */
						    position: fixed; /* 固定定位 */
						    z-index: 1; /* 设置在顶层 */
						    left: 0;
						    top: 0;
						    width: 100%; 
						    height: 100%;
						    overflow: auto; 
						    background-color: rgb(0,0,0); 
						    background-color: rgba(0,0,0,0.4); 
						}

						/* 弹窗内容 */
						.modal-content {
							border-radius: 20px;
						    background-color: #fefefe;
						    margin: 15% auto; 
						    padding: 20px;
						    border: 1px solid #888;
						    width: 300px; 
						}

						/* 关闭按钮 */
						.close {
						    color: #aaa;
						    float: right;
						    font-size: 28px;
						    font-weight: bold;
						}

						.close:hover,
						.close:focus {
						    color: black;
						    text-decoration: none;
						    cursor: pointer;
						}
					
					</style>

					<script>
						// 获取弹窗
						var modal = document.getElementById('Modal');

						// 打开弹窗的按钮对象
						var btn = document.getElementById("Btn");

						// 获取 <span> 元素，用于关闭弹窗
						var span = document.querySelector('.close');

						// 点击按钮打开弹窗
						btn.onclick = function() {
						    modal.style.display = "block";
						}

						// 点击 <span> (x), 关闭弹窗
						span.onclick = function() {
						    modal.style.display = "none";
						}

						// 在用户点击其他地方时，关闭弹窗
						window.onclick = function(event) {
						    if (event.target == modal) {
						        modal.style.display = "none";
						    }
						}
					</script>
				</div>
			</div>
			
			<img src="img/spec.png" id="spec" />
		</div>

	</body>

</html>
