<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.UserDTO"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css?ver=1"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="icon" type="image/png" href="images/icons/favicon.png?ver=1"/>
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
	<!-- login ?????? -->
	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		String isExpert="";
		
		PostDAO dao = new PostDAO();
		List<PostDTO> postList = dao.showPost();
		PortfolioDTO pf;
		
		ReviewDAO r_dao = new ReviewDAO();
		List<ReviewDTO> starratingList = r_dao.starratingList();
		
		WishListDAO w_dao = new WishListDAO();
		List<WishListDTO> wishList = null;

		ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();
		
		

	%>
	
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
										<a href="MyPage.jsp" id="p-lr-25abc123" class="flex-c-m trans-04" >		
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
							<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25" style="margin-right: 45px; ">
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
	
	<!-- ?????? -->

	<%if(info != null) {%>
		
		<!-- ????????? --><!-- ?????? -->
		<%
			wishList = w_dao.wishList(info.getEmail());
			System.out.print("??? ??? ????????? ??????");
			for(int i = 0; i<wishList.size(); i++){
				whishPostNumList.add(wishList.get(i).getPost_num());
				System.out.print(whishPostNumList.get(i)+" ");
			}
			System.out.println();
			
			System.out.println("????????? ??????"+whishPostNumList.size());
		 %>
		 
		<main>
			<!-- 
			<section class="banner">
				<div class="wrap-slick1">
					<div class="slick1">
						<img alt="banner" src="./assets/cssImg/banner.jpg">
					</div>
				</div>
			</section> -->
			
			<section style="background-color: #00D3C7; height: 480px;">
				<div style="position: absolute; top: 283px; left: 390px;">
					<h1 style="display: inline-block; color: white; font-size: 35px; font-weight: 500;">????????? ????????? ???????????? <br> ???????????????!</h1>

<!-- ????????? -->
				<div class="search-box" style="border-radius: 5px; margin-top: 20px; border-width:2px; width: 475px; height: 59px; left: 0%;margin-left: 0px; color: white;">
				    <form action="SerchMain.jsp" method="get"  class="codeShot-serchBox">
				        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput" class="search-txt" type="text"maxlength="15" style="background: round;">
				        <!-- <input type="submit" value="??????" class="search-btn"> -->
				        <button class="search-btn" type="submit" style="margin-left: 220px;
    margin-top: 10px"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></button><br>
					    <div id="codeShot-recommend" class="codeShot-invisible">
					    	<ul id="suggest-list" class="codeShot-suggestList">
					    		<!-- ?????? ????????? ?????? -->
					    	</ul>
					    </div>
				    </form>
				</div>

				</div>
			      <div id="slider-wrap" style="height: 480px; margin-left: 965px; margin-top: -20px;">
			          <ul id="slider" class="">
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FjyLtx_curated_content_item_main_desktop_989.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FqQqlc_curated_content_item_main_desktop_955.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FGQ3KS_curated_content_item_main_desktop_1005.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
					 </ul>
			      <!--controls-->
		          <div class="btns" id="next" style="background-color:rgba(255, 255, 255, 0.629); border-radius: 50px; width: 40px; height: 40px;">
		          <div style="position: absolute; top: -8px; right:2px; "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
</svg></div></div>
		          <div class="btns" id="previous" style="background-color:rgba(255, 255, 255, 0.629); border-radius: 50px; width: 40px; height: 40px; margin-left: 560px;
">
<div style="position: absolute; top: -8px; left:2px; "><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
</svg> </div> </div>
		          <div id="pagination-wrap">
		            <ul>
		            </ul>
		          </div>
		          <!--controls-->  
                 
	      </div>
	      </section>
					 
			
			<section class="section-view">
				<h1 class="codeShot-main-post-title">?????? ???????????? ??? ?????????</h1>
				<div class="blocks">
				<%for(int i=0; i<10;i++){%>
					<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
					%>
					<article id="article-tag<%=postList.get(i).getPost_num()%>">
						<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>" class="block hov-img0">
							
							<!-- ????????? ?????? -->
							<div class="block-img">
								<div class="block-b">
									<div class="block-c">
										<div class="block-img">
											<%if(pf != null){%>
												<img src="./file/<%= pf.getPf_file()%>" class="block-img-radius">
											<%}else if(pf == null){%>
												<img alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height=200px class="block-img-radius">	
											<%}%>
										</div>
									</div>
								</div>
							</div>
							
							<!-- ??? ?????? -->
							<div>
								<button id="wish-btn<%=postList.get(i).getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishPostClick('<%=postList.get(i).getPost_num() %>', this.id)">
									<span class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										
										<%int compareResult=0; %>
										
										<%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%>
										
										<%-- <%if(compareResult == 0) {%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color" class="icon-heart2 dis-block trans-04 ab-t-l" src="./assets/cssImg/heart-fill.svg"/>
										<%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->										
											<img id="btn-color" class="icon-heart1 dis-block trans-04" src="./assets/cssImg/heart.svg"/>
										<%-- <%} %> --%>
										
									</span>
								</button>
							</div>
							
							<!-- ????????? -->
							<div class="block-txt">
								
								<!-- ??????, ?????????, ?????? -->
								<div class="block-txt-name">
									<span class="block-txt-nametxt"><%=postList.get(i).getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=postList.get(i).getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=postList.get(i).getPost_price() %>???</span>
								</div>
								
								<!-- ?????? -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="???"
									src="./assets/cssImg/star-fill.svg">
								</span>
									<%
										double avg_strt = 0;
										for(int j = 0; j < starratingList.size(); j++) {
											if(postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
												avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
					<%} %>
				</div>
			</section>
		</main>
		<!-- ??????????????? end -->
		
	<!-- ????????? -->			
	<%} else if(info == null) {%>

		<main>
			<section style="background-color: #00D3C7; height: 480px;">
				<div style="position: absolute; top: 283px; left: 390px;">
					<h1 style="display: inline-block; color: white; font-size: 35px; font-weight: 500;">????????? ????????? ???????????? <br> ???????????????!</h1>

<!-- ????????? -->
				<div class="search-box" style="border-radius: 5px; margin-top: 20px; border-width:2px; width: 475px; height: 59px; left: 0%; margin-left: 0px; ">
				    <form action="SerchMain.jsp" method="get"  class="codeShot-serchBox">
				        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput" class="search-txt" type="text"maxlength="15" style="background: round;">
				        <!-- <input type="submit" value="??????" class="search-btn"> -->
				        <button class="search-btn" type="submit" style="margin-left: 220px;
    margin-top: 10px"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="white" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></button><br>
					    <div id="codeShot-recommend" class="codeShot-invisible">
					    	<ul id="suggest-list" class="codeShot-suggestList">
					    		<!-- ?????? ????????? ?????? -->
					    	</ul>
					    </div>
				    </form>
				</div>

				</div>
			      <div id="slider-wrap" style="height: 480px; margin-left: 965px; margin-top: -20px;">
			          <ul id="slider" class="">
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FjyLtx_curated_content_item_main_desktop_989.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FqQqlc_curated_content_item_main_desktop_955.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
						<li><img src="https://kmong.com/_next/image?url=https%3A%2F%2Fd2v80xjmx68n4w.cloudfront.net%2Fassets%2Fimages%2Fcurated_contents%2FGQ3KS_curated_content_item_main_desktop_1005.png&w=1200&q=75" style="width: 100%;  margin-top: 50px; border-radius: 7px;"></li>
					 </ul>
			      <!--controls-->
		          <div class="btns" id="next" style="background-color:rgba(255, 255, 255, 0.629); border-radius: 50px; width: 40px; height: 40px;">
		          <div style="position: absolute; top: -8px; right:2px; "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
</svg></div></div>
		          <div class="btns" id="previous" style="background-color:rgba(255, 255, 255, 0.629); border-radius: 50px; width: 40px; height: 40px; margin-left: 560px;
">
<div style="position: absolute; top: -8px; left:2px; "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
</svg> </div> </div>
		          <div id="pagination-wrap">
		            <ul>
		            </ul>
		          </div>
		          <!--controls-->  
                 
	      </div>
	      </section>

			<section class="section-view">
				<h1 class="codeShot-main-post-title">?????? ???????????? ??? ?????????</h1>
				<div class="blocks">
				<%for(int i=0; i<10;i++){%>
					<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
					%>
					<article id="article-tag<%=postList.get(i).getPost_num()%>">
						<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>" class="block hov-img0">
							
							<!-- ????????? ?????? -->
							<div class="block-img">
								<div class="block-b">
									<div class="block-c">
										<div class="block-img">
											<%if(pf != null){%>
												<img src="./file/<%= pf.getPf_file()%>" class="block-img-radius">
											<%}else if(pf == null){%>
												<img alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height=200px class="block-img-radius">	
											<%}%>
										</div>
									</div>
								</div>
							</div>
							
							<!-- ??? ?????? -->
							<div>
								<button id="wish-btn<%=postList.get(i).getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishPostClick('<%=postList.get(i).getPost_num() %>', this.id)">
									<span class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										
										<%int compareResult=0; %>
										
										<%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%>
										
										<%-- <%if(compareResult == 0) {%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color" class="icon-heart2 dis-block trans-04 ab-t-l" src="./assets/cssImg/heart-fill.svg"/>
										<%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->										
											<img id="btn-color" class="icon-heart1 dis-block trans-04" src="./assets/cssImg/heart.svg"/>
										<%-- <%} %> --%>
										
									</span>
								</button>
							</div>
							
							<!-- ????????? -->
							<div class="block-txt">
								
								<!-- ??????, ?????????, ?????? -->
								<div class="block-txt-name">
									<span class="block-txt-nametxt"><%=postList.get(i).getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=postList.get(i).getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=postList.get(i).getPost_price() %></span>
								</div>
								
								<!-- ?????? -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="???" src="./assets/cssImg/star-fill.svg">
									</span>
									<%
										double avg_strt = 0;
										for(int j = 0; j < starratingList.size(); j++) {
											if(postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
												avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
					<%} %>
				</div>
			</section>
		</main>
		<!-- ??????????????? end -->
	<%} %>
	
	

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
	<!-- script -->
		
	<!-- 2022-11-02 / ????????? / ?????? ????????? ?????? ?????? -->
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	
	<!-- ????????? ?????? ?????? ???????????? ??????-????????? ?????????.... -->
	<!-- <script src="./assets/js/SuggestWord.js"></script> -->
	
	<!-- ??? ?????? -->
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				// swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				// $(this).off('click');
			});
		});
	</script>
	
	<script src="assets/js/WishBtn.js"></script>
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="assets/js/PortfolioSlider.js"></script>

</body>
</html>