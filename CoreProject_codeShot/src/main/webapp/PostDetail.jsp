<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>


<!-- header css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	
	
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css" href="./assets/css/body.css">
<link rel="stylesheet" type="text/css" href="./assets/css/PostDetail.css">


<!-- a?????? ?????? ????????? ?????? style ?????? -->
<style type="text/css">
	* {
		color:  rgb(48, 52, 65);
	}
	a:hover{
		text-decoration: none;
	}
	a{
		text-decoration: none;
	}
	
	
	#mypage-btn-expert{
		display: inline;
		height: 45px;
		margin: 8px 0px 0px 0px;
	}
	#mypage-btn-expert:hover{
		background-color:  rgb(189, 244, 236);
		border-radius: 5px 5px 5px 5px;
	}
	
	#mypage-btn{
		display: inline;
		height: 45px;
		margin: 8px 0px 0px 180px;
	}
	#mypage-btn:hover{
		background-color:  rgb(189, 244, 236);
		border-radius: 5px 5px 5px 5px;
	}
	
	#p-lr-25abc123{
		margin: 10px 0px 0px 0px;
	}

	.search-box{
		margin-left: 125px;
	}
	
	.block-txt-title {
		word-break: break-all;
		overflow: hidden;
		-webkit-line-clamp: 2;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		font-weight: bold;
		margin: 8px 0px 3px 0px;
		font-size: 15px;
		height: 40px;
		text-align: start;
	}
	
	.block-img{
		  display: block;
		  width: 100%;
		  height: 100%;
		  border-radius: 5px;
		  border: 1px ;
		  object-fit: cover;

	}
 .search-txt {
    float: left;
    font-size: 15px;
    padding-left: 20px;
    margin-bottom: 3px;
    margin-left: 2px;
    margin-right: 0px;
    color: rgb(154, 155, 167);
  }

	  .codeShot-logAndJonin {
    width: 300px;
    height: 43px;
    margin-right: -80px;
  }
</style>


</head>
<body>
	<%
	//????????? ??????
	UserDTO info = (UserDTO)session.getAttribute("info");
	String isExpert="";	

	//????????? ?????? ????????????
	BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
	System.out.print(postNum);
	PostDTO post = new PostDAO().showPostDetail(postNum);
	
	//????????? ?????????, ??????????????? ????????????
	List<PortfolioDTO> portfolioList = new PortfolioDAO().showWriterPortfolio(post.getMem_email());
		
	//?????? ????????????
	ReviewDAO dao = new ReviewDAO();
	System.out.print("Test : "+dao);
	List<ReviewDTO> reviewList = dao.showPostReview(postNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	DecimalFormat starrating_df = new DecimalFormat("#.0");
	%>
	<!-- ????????? ?????? -->
	<!-- Header -->
	<header class="container-menu-desktop">
		<section class="top-bar">
			<div class="content-topbar flex-sb-m h-full container codeShot-topbar">
				<div class="left-top-bar">
					<!-- ?????? ????????? -->
					<a href="Main.jsp" class="logo">
						<img src="./assets/cssImg/logo.png" alt="IMG-LOGO" width="290px" height="100%">
					</a>
				</div>
				
				<!-- ????????? -->
				<div class="search-box">
				    <form action="SerchMain.jsp" method="get"  class="codeShot-serchBox">
				        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput" class="search-txt" type="text" placeholder="???????????? ??????????????????" maxlength="15">
				        <!-- <input type="submit" value="??????" class="search-btn"> -->
				        <button class="search-btn" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></button><br>
		<!-- 			    <div id="codeShot-recommend" class="codeShot-invisible">
					    	<ul id="suggest-list" class="codeShot-suggestList">
					    		?????? ????????? ??????
					    	</ul>
					    </div>-->
				    </form> 
				</div>
				
				<!-- ?????????, ????????????, ????????????, ??????????????? -->
				<div class="codeShot-logAndJonin">
					<div class="right-top-bar flex-w h-full">
						
						<!-- ?????? -->
						<%if(info != null) {%>
							
							<!-- ????????? -->
							<%if((isExpert = info.getIsExpert()).equals("Y")) {%>
								<a href="PostWrite.jsp"class="flex-c-m trans-04 p-lr-25">
									<b>????????????</b>
								</a>
								<ul id="mypage-btn-expert" class="main-menu">
									<li class="codeShot-ots-menu">
										<a href="MyPage.jsp" id="p-lr-25abc123" class="flex-c-m trans-04">		
											<b>???????????????</b>
										</a>
										<ul class="sub-menu codeShot-subMenu">
											<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">????????? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="EditPost.jsp">????????? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="PortfolioWrite.jsp">??????????????? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">??????</a></li>
											<li class="codeShot-subMenu-li"><a href="WishList.jsp">??? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">????????????</a></li>
											<li class="codeShot-subMenu-li"><a href="LogoutService.do">????????????</a></li>
										</ul>
									</li>
								</ul>
								
							<!-- ?????? -->
							<%} else if((isExpert = info.getIsExpert()).equals("N")){%>
								
								<ul id="mypage-btn" class="main-menu">
									<li class="codeShot-ots-menu">
										<a href="MyPage.jsp" id="p-lr-25abc123" class="flex-c-m trans-04">		
											<b>???????????????</b>
										</a>
										<ul class="sub-menu codeShot-subMenu">
											<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">????????? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">??????</a></li>
											<li class="codeShot-subMenu-li"><a href="WishList.jsp">??? ??????</a></li>
											<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">????????????</a></li>
											<li class="codeShot-subMenu-li"><a href="LogoutService.do">????????????</a></li>
										</ul>
									</li>
								</ul>
							<%} %>

						<!-- ????????? -->
						<%} else if(info == null) {%>
							<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25">
								<b>?????????</b>
							</a>
							<a href="JoinSelect.jsp" class="flex-c-m trans-04 p-lr-25">
								<b>????????????</b>
							</a>
						<%}%>
					</div>
				</div>
			</div>
		</section>
		
		<section class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container codeShot-nav">
				<!-- Menu -->
				<div class="menu-desktop">
				<ul class="main-menu">
					<li class="codeShot-ots-menu">
						<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost" class="codeShot-menuBarBottom">??????</a>
						<ul class="sub-menu codeShot-subMenu">
							<li class="codeShot-subMenu-li"><a href="#">???</a></li>
							<li class="codeShot-subMenu-li"><a href="#">???</a></li>
						</ul>
					</li>
					
					<li class="codeShot-code-menu">
						<a href="PostMain.jsp?postType=codePost" id="codePost" class="codeShot-menuBarBottom">????????????</a>
						<ul class="sub-menu codeShot-subMenu">
							<li class="codeShot-subMenu-li"><a href="#">???</a></li>
							<li class="codeShot-subMenu-li"><a href="#">???</a></li>
						</ul>
					</li>
					<li>
						<a href="FAQ.jsp" class="codeShot-menuBarBottom">FAQ</a>
					</li>
					
					<li>
						<a href="SiteIntroduce.jsp" class="codeShot-menuBarBottom">????????? ?????????</a>
					</li>
					
				</ul>
				</div>
			</nav>

		</section>
	</header>
	
	<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<!-- Main -->
	<!-- ????????? ???????????????  -->
	<main>
	<div class="flex">
		<div>
			<% if(portfolioList.size()!=0){ %>
					<img class="post-img" src="file/<%= portfolioList.get(0).getPf_file() %>">
			<% 	} %>
				<ul class="tab-list">
					<li > ??????????????? </li>
					<li> ????????? ?????? </li>
					<li> ????????? ???????????? </li>
					<li> ?????????(??????) </li>
					<li> ?????? </li>
				</ul>
			<h3> ???????????????</h3>
			
			<% if(portfolioList.size()!=0){ %>
				<div id="wrapper">
			      <div id="slider-wrap">
			          <ul id="slider">
				<%for(PortfolioDTO dto : portfolioList){ %>
						<li><img src="file/<%= dto.getPf_file()%>"></li>
					<% } %>
					 </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
      </div>
					
			<%	}%>
			<h3> ????????? ?????? </h3>
			<%= post.getPost_explain() %>
			<h3> ????????? ???????????? </h3>
			<%= post.getPost_precautions() %>
			<h3> ?????????(??????) </h3>
			<%= post.getPost_standard() %>
			<h3> ?????? </h3>
			<%
			if(reviewList !=null){
			%>
			<div class="post-detail-review-list">
				<%
				for(int i = 0; i<reviewList.size(); i++ )
				{
				%>
		        <div class="post-detail-review">
		            <div class="post-detail-review-email"><%=reviewList.get(i).getMem_email()%></div>
		            <div class="post-detail-review-sdbox">
		                <div class="post-detail-review-starrating">
		                    <img src="./assets/cssImg/star-fill.svg" class="post-detail-review-starrating-starfill">
		                    <%=starrating_df.format(reviewList.get(i).getReview_starrating()) %>
		                </div>
		                <div class="post-detail-review-date">
		                	<%=sdf.format(reviewList.get(i).getReview_date())%>
		                </div>
		            </div>
		            <div class="post-detail-review-content">
		            	<p>
		            		<%=reviewList.get(i).getReview_content()%>
		            	</p>
		            </div>
		        </div>
		        <hr class="post-detail-review-devide">
		        <%
				}
		        %>
		    </div>
		    <%
			}
		    %>
		</div>
	
		<div class="price-pay-chat">
			<h1><%= post.getPost_title() %></h1>
			<fieldset>
				<br>
				<div class="price"> <%= post.getPost_price() %>??? </div>
				<br>
				<a href="Payment.jsp?postNum=<%=postNum%>"><button class="btn-info">????????????</button></a>
			</fieldset>
			<fieldset>
				<br>
				<div>
				?????? ?????? ?????? : 10??? ~ 19???
				<br>
				?????? ?????? ?????? : 2?????? ??????
				</div>
				<br>
				<a href="CreateChatRoomService.do?sellerEmail=<%=post.getMem_email()%>&postTitle=<%=post.getPost_title()%>"><button class="btn-info">????????????</button></a>
			</fieldset>
		</div>
	</div>
</main>	
	<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- footer -->

	<footer class="footer">
		<div class="footer-inner">
			<ol style="width:40%">
				<b>DDock</b> | ??????????????? ?????? ????????? 31-15, 7??? |
    		</ol>
    		<ol><a href=#>????????????</a></ol>
    		<ol><a href=#>FAQ</a></ol>
    		<ol><a href=#>????????????</a></ol>
    		<ol><a href=#><b>????????????????????????</b></a></ol>
		</div>
	</footer>
	
	<!-- script  -->
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="assets/js/PortfolioSlider.js"></script>
</body>
</html>