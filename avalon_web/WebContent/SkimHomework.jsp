<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- 本地引用Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap-theme.css" />
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/style_skimHomework.css" />

		<link rel="shortcut icon" href="img/logo-white.ico" />
		<title>作業瀏覽-avalon</title>

		<meta name="author" content="author: army_red - 吃小米长大的枪" />
		<meta name="generator" content="VScode / HBuilder" />
		<meta name="keywords" content="HTML,JSP,SQL">
	</head>
	<body onselectstart="return true">

		<!-- 引用jQ -->
		<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
		<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		<!-- bootstrap js -->
		<script src="js/bootstrap.js"></script>
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
		
		

		<!-- 切换页面以后的小玩意 -->
		<script type="text/javascript">
			document.addEventListener('visibilitychange', function() {
				var isHidden = document.hidden;
				if (isHidden) {
					document.title = '|・ω・) 你看不見我~你看不見我~';
				} else {
					document.title = '_(:з」還是看見了...';
				}
			});
		</script>



		<!-- 手机适配 -->
		<script>
			if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
			    window.location.href = "SkimHomework-phone.html";     //手机
			 } 
		</script>
		<!-- 100% width -->
		<div class="container-fluid" id="mainbody">


			<!-- 头部 -->
			<div class="row" id="nav">

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
				<!-- 不添加个注释编译器有bug 唉 -->

				<img src="img/logo%20黑白.png" alt="" onclick="window.location.href='index.jsp'" />



				<img class="user_head" src="img/用户.svg" alt="" onclick="clickAccount()" />

				<p class="user_name" onclick="clickAccount()">
					<% out.print(name); %>
				</p>


			</div>




			<div class="row">

				<script>
					// 我爱死这个功能了
					 //它可以让选择某个课程的时候隐藏其他课程
					 
					$(document).ready(function(){
						
						$(".btn-primary").click(function(){
							
							var num = $(this).attr("aria-controls");
							//var num_length = num.length;
							//console.log('num = ' + num.substring(num_length-2,num_length));
							
							$('#' + num).siblings(".collapse").collapse('hide');
						});
						
					});

				</script>

				<!-- 课程列 -->
				<div class="col-md-3" id="lesson-list">

					<div class="row" id="title">LESSON</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#" aria-expanded="true"
						 aria-controls="none" onclick="$('.collapse').collapse('toggle');">
							展示全部課程作業
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_01"
						 aria-expanded="true" aria-controls="collapse_in_id_01">
							#classname_id_01#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_02"
						 aria-expanded="true" aria-controls="collapse_in_id_02">
							#classname_id_02#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_03"
						 aria-expanded="true" aria-controls="collapse_in_id_03">
							#classname_id_03#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_04"
						 aria-expanded="true" aria-controls="collapse_in_id_04">
							#classname_id_04#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_05"
						 aria-expanded="true" aria-controls="collapse_in_id_05">
							#classname_id_05#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_06"
						 aria-expanded="true" aria-controls="collapse_in_id_06">
							#classname_id_06#
						</a>
					</div>

					<div class="row">

						<a class="btn btn-primary" role="button" data-parent="#accordion" data-toggle="collapse" href="#collapse_in_id_07"
						 aria-expanded="true" aria-controls="collapse_in_id_07">
							#classname_id_07#
						</a>
					</div>

				</div>




				<!-- 详细展示列 -->
				<div class="col-md-9 spy-obj">


					<div class="row" id="title">作業詳情</div>


					<div class="row">



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_01">
							<div class="panel-body">

								<div class="container">

									<div class="row">
										<p>#class-homework-informations-id:01#</p>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-title">date</div>
										<div class="col-md-3" id="homework-title">theme</div>
										<div class="col-md-6" id="homework-title">details</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>


									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>
									
								</div>


							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_02">
							<div class="panel-body">
								<div class="container">

									<div class="row">
										<p>#class-homework-informations-id:02#</p>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-title">date</div>
										<div class="col-md-3" id="homework-title">theme</div>
										<div class="col-md-6" id="homework-title">details</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>
									

							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_03">
							<div class="panel-body">
								<div class="container">

									<div class="row">
										<p>#class-homework-informations-id:03#</p>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-title">date</div>
										<div class="col-md-3" id="homework-title">theme</div>
										<div class="col-md-6" id="homework-title">details</div>
									</div>
									<div class="row">

										<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
										<div class="col-md-3" id="homework-information">#class-id-theme#</div>
										<div class="col-md-6" id="homework-information">#informations#</div>
									</div>

								</div>
							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_04">
							<div class="panel-body">
								<div class="row">
									<p>#class-homework-informations-id:04#</p>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-title">date</div>
									<div class="col-md-3" id="homework-title">theme</div>
									<div class="col-md-6" id="homework-title">details</div>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
									<div class="col-md-3" id="homework-information">#class-id-theme#</div>
									<div class="col-md-6" id="homework-information">#informations#</div>
								</div>
							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_05">
							<div class="row">
								<p>#class-homework-informations-id:05#</p>
							</div>
							<div class="row">

								<div class="col-md-3" id="homework-title">date</div>
								<div class="col-md-3" id="homework-title">theme</div>
								<div class="col-md-6" id="homework-title">details</div>
							</div>
							<div class="row">

								<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
								<div class="col-md-3" id="homework-information">#class-id-theme#</div>
								<div class="col-md-6" id="homework-information">#informations#</div>
							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_06">
							<div class="panel-body">
								<div class="row">
									<p>#class-homework-informations-id:06#</p>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-title">date</div>
									<div class="col-md-3" id="homework-title">theme</div>
									<div class="col-md-6" id="homework-title">details</div>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
									<div class="col-md-3" id="homework-information">#class-id-theme#</div>
									<div class="col-md-6" id="homework-information">#informations#</div>
								</div>
							</div>
						</div>



						<div class="panel-collapse collapse" role="tabpanel" id="collapse_in_id_07">
							<div class="panel-body">
								<div class="row">
									<p>#class-homework-informations-id:07#</p>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-title">date</div>
									<div class="col-md-3" id="homework-title">theme</div>
									<div class="col-md-6" id="homework-title">details</div>
								</div>
								<div class="row">

									<div class="col-md-3" id="homework-information">#yyyy-mm-dd#</div>
									<div class="col-md-3" id="homework-information">#class-id-theme#</div>
									<div class="col-md-6" id="homework-information">#informations#</div>
								</div>
							</div>
						</div>



					</div>

				</div>


			</div>



		</div>

		<div>

			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="calen">
				<img src="img/日历.svg" />

			</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">作業行事曆</h4>
						</div>


						<div class="modal-body">


							<div class="cldBody">
								<table>
									<thead>
										<tr>
											<td colspan="7">
												<div class="top">
													<span id="left">
														<</span> <span id="topDate">
													</span>
													<span id="right">></span>
												</div>
											</td>
										</tr>
										<tr id="week">
											<td>日</td>
											<td>一</td>
											<td>二</td>
											<td>三</td>
											<td>四</td>
											<td>五</td>
											<td>六</td>
										</tr>
									</thead>
									<tbody id="tbody"></tbody>
								</table>

								<style type="text/css">
									.cldBody {
										background: #f7f7f7;
										width: 420px;
										margin: 10px auto;
									}

									.cldBody .top {
										height: 60px;
										line-height: 60px;
										text-align: center;
										position: relative;
									}

									#topDate {
										font-size: 24px;
									}

									#week td {
										font-size: 15px;
									}

									td {
										width: 60px;
										height: 60px;
										line-height: 60px;
										text-align: center;
										font-size: 20px;
									}

									#tbody td:hover {
										background: #ededed;
										cursor: pointer;
									}

									.curDate {
										color: red;
										font-weight: bold;
									}

									#left,
									#right {
										width: 60px;
										height: 60px;
										position: absolute;
										cursor: pointer;
									}

									#left {
										left: 0;
									}

									#right {
										right: 0;
									}

									#left:hover,
									#right:hover {
										background-color: rgba(30, 30, 30, 0.2);
									}
								</style>

								<script>
									var date = new Date();
			                var year = date.getFullYear();
			                var nowyear = date.getFullYear();
			                var month = date.getMonth() + 1;
			                var nowmonth = date.getMonth() + 1;
			                var dateday = date.getDate();
			                var todateHtml = year + '年' + month + '月';
			                $('#topDate').text(todateHtml)
			        
			                function showcld() {
			                    var monthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // 创建数组存放每个月有多少天 ,默认2月为28天
			                    // 判断闰年
			                    if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			                        monthDay[1] = 29;
			                    }
			                    // 计算每个月的天数
			                    var days = monthDay[month - 1];
			                    // 判断每月第一天为周几
			                    date.setYear(year); //某年
			                    date.setMonth(month - 1); //某年的某月
			                    date.setDate(1); // 某月的某天
			                    var weekday = date.getDay(); // 判断某天是周几
			                    // 补齐一号前的空格
			                    var tbodyHtml = '<tr>';
			                    for (var i = 0; i < weekday; i++) {
			                        tbodyHtml += "<td></td>";
			                    }
			                    // 补齐每月的日期
			                    var changLine = weekday;
			                    var tagClass = '';
			                    for (i = 1; i <= days; i++) { //每一个日期的填充
			                        if (year == nowyear && month == nowmonth && i == dateday) {
			                            tagClass = "curDate"; //当前日期对应格子
			                        } else {
			                            tagClass = "isDate";
			                        }
			                        tbodyHtml += "<td class=" + tagClass + ">" + i + "</td>";
			                        changLine = (changLine + 1) % 7;
			                        if (changLine == 0 && i != days) { //是否换行填充的判断
			                            tbodyHtml += "</tr><tr>";
			                        }
			                    }
			                    $('#tbody').empty(); // 清空原有的内容
			                    $('#tbody').append(tbodyHtml); //添加当前月份的日期内容
			                }
			        
			                // 设置按钮点击事件
			                $('#left').click(function() {
			                    month = month - 1;
			                    if (month < 1) {
			                        month = 12;
			                        year--;
			                    }
			                    var todateHtml = year + '年' + month + '月';
			                    $('#topDate').text(todateHtml);
			                    showcld();
			                });
			        
			                $('#right').click(function() {
			                    month = month + 1;
			                    if (month > 12) {
			                        month = 1;
			                        year++;
			                    }
			                    var todateHtml = year + '年' + month + '月';
			                    $('#topDate').text(todateHtml);
			                    showcld();
			                })
			                showcld(); //页面加载后执行函数
			            </script>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>



							<button type="button" class="btn btn-primary">保存/導出</button>
							<!-- 上面的還沒實現！！ -->




						</div>
					</div>
				</div>
			</div>
		</div>

		<br />

		<div class="owner">
			<a href="https://github.com/THUAvalonProject">©Copyright: Avalon project group - army_red</a>

		</div>
		<!-- 曾经的登陆界面 -->
		<!-- <div id="mask" onclick="hideLoginBox()"></div>
		<style>
			#mask{
				position: absolute;
				width: 100%;
				height: 100%;
				background-color: #000000;
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
		</script> -->
	</body>
</html>
