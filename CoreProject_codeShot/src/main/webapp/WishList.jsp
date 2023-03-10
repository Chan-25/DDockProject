<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.PrchsDTO"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.WishListDTO"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- <link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css"> -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/wishlist.css">
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
	System.out.println("[????????? ?????????]");

	// ????????? ??????
	UserDTO info = (UserDTO)session.getAttribute("info");
	String isExpert = "";
	
	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = w_dao.wishList(info.getEmail());
	
	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();
	
	System.out.println("??? ????????? ?????????: "+wishList.size());
	System.out.println("?????? ?????????: "+starratingList.size());
%>
<!-- Header -->
	<header class="container-menu-desktop" >
		<section class="top-bar">
			<div
				class="content-topbar flex-sb-m h-full container codeShot-topbar">
				<div class="left-top-bar">
					<!-- ?????? ????????? -->
					<a href="Main.jsp" class="logo"> <img
						src="./assets/cssImg/logo.png" alt="IMG-LOGO" width="290px"
						height="100%">
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
						<%
						if (info != null) {
						%>

						<!-- ????????? -->
						<%
						if ((isExpert = info.getIsExpert()).equals("Y")) {
						%>
						<a href="PostWrite.jsp" class="flex-c-m trans-04 p-lr-25"> <b>????????????</b>
						</a>
						<ul id="mypage-btn-expert" class="main-menu">
							<li class="codeShot-ots-menu"><a href="MyPage.jsp"
								id="p-lr-25abc123" class="flex-c-m trans-04"> <b>???????????????</b>
							</a>
								<ul class="sub-menu codeShot-subMenu">
									<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">?????????
											??????</a></li>
									<li class="codeShot-subMenu-li"><a href="EditPost.jsp">?????????
											??????</a></li>
									<li class="codeShot-subMenu-li"><a
										href="PortfolioWrite.jsp">??????????????? ??????</a></li>
									<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">??????</a></li>
									<li class="codeShot-subMenu-li"><a href="WishList.jsp">???
											??????</a></li>
									<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">????????????</a></li>
									<li class="codeShot-subMenu-li"><a href="LogoutService.do">????????????</a></li>
								</ul></li>
						</ul>

						<!-- ?????? -->
						<%
						} else if ((isExpert = info.getIsExpert()).equals("N")) {
						%>

						<ul id="mypage-btn" class="main-menu">
							<li class="codeShot-ots-menu"><a href="MyPage.jsp"
								id="p-lr-25abc123" class="flex-c-m trans-04"> <b>???????????????</b>
							</a>
								<ul class="sub-menu codeShot-subMenu">
									<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">?????????
											??????</a></li>
									<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">??????</a></li>
									<li class="codeShot-subMenu-li"><a href="WishList.jsp">???
											??????</a></li>
									<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">????????????</a></li>
									<li class="codeShot-subMenu-li"><a href="LogoutService.do">????????????</a></li>
								</ul></li>
						</ul>
						<%
						}
						%>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</section>
		<section class="wrap-menu-desktop" style="margin-left: 300px;">
			<nav class="limiter-menu-desktop container">
				<!-- Menu -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="codeShot-ots-menu"><a
							href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost"
							class="codeShot-menuBarBottom">??????</a>
							<ul class="sub-menu codeShot-subMenu">
								<li class="codeShot-subMenu-li"><a href="#">???</a></li>
								<li class="codeShot-subMenu-li"><a href="#">???</a></li>
							</ul></li>

						<li class="codeShot-code-menu"><a
							href="PostMain.jsp?postType=codePost" id="codePost"
							class="codeShot-menuBarBottom">????????????</a>
							<ul class="sub-menu codeShot-subMenu">
								<li class="codeShot-subMenu-li"><a href="#">???</a></li>
								<li class="codeShot-subMenu-li"><a href="#">???</a></li>
							</ul></li>
						<li><a href="FAQ.jsp" class="codeShot-menuBarBottom">FAQ</a>
						</li>

						<li><a href="SiteIntroduce.jsp"
							class="codeShot-menuBarBottom">????????? ?????????</a></li>

					</ul>
				</div>
			</nav>

		</section>
	</header>

	<!-- main  -->
	<main>
		<div class="flex margin-top-60 margin-left-20">
			<div class="side-menu-wrapper">
				<div data-v-17364d77="" id="side_menu_wrapper"
					class="MyPageSideMenu isSellerMinHeight">
					<div data-v-17364d77="" class="side-menu-title-wrapper NGB">
						???????????????</div>
					<div data-v-17364d77="" class="guide-line"></div>
					<div data-v-17364d77="" class="menu-list-wrapper">
						<ul data-v-17364d77="" id="side_menu_main_group"
							class="main-menu-wrapper">
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="EditInfo.jsp" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										??? ?????? ??????
										<!---->
										<!---->
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="MyPage.jsp" class="active">
										???????????? </a> <a data-v-17364d77="" href="#sellerSellingHistory"
										aria-controls="sellerSellingHistory" aria-expanded="true"
										data-toggle="collapse" data-parent="#side_menu_main_group"
										class="active">
										<div data-v-17364d77="" role="tab">
											<div data-v-17364d77="" class="flex">
												<i data-v-17364d77="" class="kf kf-arrow"> </i>
											</div>
										</div>
									</a>
								</div>
								<div data-v-17364d77="" id="sellerSellingHistory"
									class="collapse in">
									<div data-v-17364d77="" class="panel-body">
										<div data-v-17364d77=""
											class="new-label-wrapper active">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? ????????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? ?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? 
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="EditPost.jsp" class=""> ????????? ?????? </a> <a
										data-v-17364d77="" href="#sellerProposals"
										aria-controls="sellerProposals" data-toggle="collapse"
										data-parent="#side_menu_main_group" class="">
										<div data-v-17364d77="" role="tab">
											<div data-v-17364d77="" class="flex">
												<i data-v-17364d77="" class="kf kf-arrow"> </i>
											</div>
										</div>
									</a>
								</div>
								<div data-v-17364d77="" id="sellerProposals" class="collapse">
									<div data-v-17364d77="" class="panel-body">
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> ?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> ????????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> ?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> ?????? 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> ?????? 
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="PortfolioWrite.jsp" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										??????????????? ??????
										<!---->
										<!---->
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="ChatMain.jsp" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										??????
										<!---->
										<!---->
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="WishList.jsp" class=""> ??? ?????? </a> <a
										data-v-17364d77="" href="#myGigs" aria-controls="myGigs"
										data-toggle="collapse" data-parent="#side_menu_main_group"
										class="">
										<div data-v-17364d77="" role="tab">
											<div data-v-17364d77="" class="flex">
												<i data-v-17364d77="" class="kf kf-arrow"> </i>
											</div>
										</div>
									</a>
								</div>
								<div data-v-17364d77="" id="myGigs" class="collapse">
									<div data-v-17364d77="" class="panel-body">
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? </span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="ReviewList.jsp" class=""> ????????????
									</a> <a data-v-17364d77="" href="#advertisement"
										aria-controls="advertisement" data-toggle="collapse"
										data-parent="#side_menu_main_group" class="">
										<div data-v-17364d77="" role="tab">
											<div data-v-17364d77="" class="flex">
												<i data-v-17364d77="" class="kf kf-arrow"> </i>
											</div>
										</div>
									</a>
								</div>
								<div data-v-17364d77="" id="advertisement" class="collapse">
									<div data-v-17364d77="" class="panel-body">
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? ????????? ?????? <!----> <!---->
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? ????????? ?????? <!----> <!---->
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="LogoutService.do" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										????????????
										<!---->
										<!---->
									</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="wishlist-area">
        <div class="wishlist-ots">
            <div class="wishlist-ots-head">
                ??????
            </div>
            <hr>
            <div class="wishlist-content">
            	<%
            	List<PostDTO> wishOtsPostList = new ArrayList<PostDTO>();
            	List<PostDTO> wishCodePostList = new ArrayList<PostDTO>();
            	PostDAO p_dao = new PostDAO();
            	for(WishListDTO dto : wishList){
            		PostDTO p_dto = p_dao.showPostDetail(dto.getPost_num());
            		if(p_dto.getPost_category().contains("ots"))
            			wishOtsPostList.add(p_dto);
            		else if(p_dto.getPost_category().contains("code"))
            			wishCodePostList.add(p_dto);
            	}
            	System.out.println("?????? ?????? : "+wishOtsPostList.size());
            	System.out.println("???????????? ?????? : "+wishCodePostList.size());
            	for(int i = 0; i < wishOtsPostList.size()/3+1; i++){
            		if(i*3 != wishOtsPostList.size()){
            	%>
                <div class="wishlist-content-rows">
                	<%
            		}
            		for(int j = 0; j < 3; j++){
            			if(3*i+j == wishOtsPostList.size()){
            				break;
            			}
	            		PostDTO post = new PostDAO().showPostDetail(wishOtsPostList.get(3*i+j).getPost_num());
	            		PortfolioDTO pf = new PortfolioDAO().showImage(wishOtsPostList.get(3*i+j).getMem_email());
                	%>
                    <article id="article-tag<%=post.getPost_num()%>" class="wishlist-content-detail">
						<a href="PostDetail.jsp?post_num=<%=post.getPost_num()%>" class="block hov-img0">
							
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
								<button id="wish-btn<%=post.getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishClick('<%=post.getPost_num() %>', this.id, <%=post.getPost_category()%>)">
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
									<span class="block-txt-nametxt"><%=post.getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=post.getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=post.getPost_price()%>???</span>
								</div>
								
								<!-- ?????? -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="???" src="./assets/cssImg/star-fill.svg">
									</span>
									<%
										double avg_strt = 0;
										for(int k = 0; k < starratingList.size(); k++) {
											if(post.getPost_num().intValue() == starratingList.get(k).getPost_num().intValue()){
												avg_strt = starratingList.get(k).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
				<%
            		}
					if(i * 3 != wishOtsPostList.size()){
				%>
                </div>
                <%
					}
           		}
				%>
            </div>
        </div>
        <div class="wishlist-code">
            <div class="wishlist-code-head">
                ????????????
            </div>
            <hr>
            <div class="wishlist-content">
            	<%
            	for(int i = 0; i < wishCodePostList.size()/3+1; i++){
            		if(i*3 != wishCodePostList.size()){
            	%>
                <div class="wishlist-content-rows">
                	<%
            		}
            		for(int j = 0; j < 3; j++){
            			if(3*i+j == wishCodePostList.size()){
            				break;
            			}
	            		PostDTO post = new PostDAO().showPostDetail(wishCodePostList.get(3*i+j).getPost_num());
	            		PortfolioDTO pf = new PortfolioDAO().showImage(wishCodePostList.get(3*i+j).getMem_email());
                	%>
                    <article id="article-tag<%=post.getPost_num()%>" class="wishlist-content-detail">
						<a href="PostDetail.jsp?post_num=<%=post.getPost_num()%>" class="block hov-img0">
							
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
								<button id="wish-btn<%=post.getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishClick('<%=post.getPost_num() %>', this.id, <%=post.getPost_category()%>)">
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
									<span class="block-txt-nametxt"><%=post.getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=post.getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=post.getPost_price() %>???</span>
								</div>
								
								<!-- ?????? -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="???" src="./assets/cssImg/star-fill.svg">
									</span>
									<%
										double avg_strt = 0;
										for(int k = 0; k < starratingList.size(); k++) {
											if(post.getPost_num().intValue() == starratingList.get(k).getPost_num().intValue()){
												avg_strt = starratingList.get(k).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
				<%
            		}
					if(i * 3 != wishCodePostList.size()){
				%>
                </div>
                <%
					}
           		}
				%>
            </div>
        </div>
    </div>
		</div>
	</main>
	<!-- footer -->
	<footer class="footer">
		<div class="footer-inner">
			<ol style="width: 40%">
				<b>DDock</b> | ??????????????? ?????? ????????? 31-15, 7??? |
			</ol>
			<ol>
				<a href=#>????????????</a>
			</ol>
			<ol>
				<a href=#>FAQ</a>
			</ol>
			<ol>
				<a href=#>????????????</a>
			</ol>
			<ol>
				<a href=#><b>????????????????????????</b></a>
			</ol>
		</div>
	</footer>
<!-- ????????? ?????? -->
<%if(info == null) {%>
	<p>????????? ????????????</p>
<%} else{ %>
	<h1>DDock</h1>
	<div>
	    <h3>??????</h3>
	    <form action="SerchMain.jsp" method="get">
	        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput">
	        <input type="submit" value="??????">
		    <ul id="suggest-list"></ul> 
	    </form>
	</div>
	<div>
		<h3>??????</h3>
		<a href="PostWrite.jsp">????????????</a>
		<a href="MyPage.jsp">???????????????</a>
		<a href="LogoutService.do">????????????</a>
		<ul>
			<li><a href="EditInfo.jsp">????????? ??????</a></li>
			<li><a href="EditPost.jsp">????????? ??????</a></li>
			<li><a href="ChatMain.jsp">??????</a></li>
			<li><a href="WishList.jsp">??? ??????</a></li>
			<li><a href="ReviewList.jsp">????????????</a></li>
		</ul>
	</div>
	<div>
		<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">??????</a>
		<a href="PostMain.jsp?postType=codePost" id="codePost">????????????</a>
		<a href="SiteIntroduce.jsp">???????????????</a>
		<a href="FAQ.jsp">FAQ</a>
	</div>

<!-- ????????? -->
	<div>
		<nav>
			<div>?????? ?????????</div>
			<div>div ?????? ?????? ???????????? ????????? ?????????</div>
			<section>
				<div>?????????</div>
				<div>div ?????? ?????? ???????????? ????????? ?????????</div>
			</section>
			<div>
				<div>??????(<span id="all-cont"><%=wishList.size() %></span>)</div>
				<%
					int otsCont = 0;
					int codeCont = 0;
				
					for(int i = 0; i < wishList.size(); i++) {
						if(wishList.get(i).getPost_category().equals("ots_web") || wishList.get(i).getPost_category().equals("ots_app")) {
							otsCont++;	
						} else if(wishList.get(i).getPost_category().equals("code_web") || wishList.get(i).getPost_category().equals("code_app")){
							codeCont++;							
						} else {
							
						}
					}
					out.print("<div>??????(<span id='ots-cont'>"+otsCont+"</span>)</div>");
					out.print("<div>????????????(<span id='code-cont'>"+codeCont+"</span>)</div>");
				%>
			</div>
		</nav>
		
		<div>
			<div>
				<div id="article-group">
					<%for(int i = 0; i < wishList.size(); i++) {%>
						<article id="article-tag<%=wishList.get(i).getPost_num()%>">
								<div>??????: <%=wishList.get(i).getPost_file() %></div>
								<div>
									<button id="wish-btn<%=wishList.get(i).getPost_num()%>" onclick="wishClick('<%=wishList.get(i).getPost_num() %>', this.id, '<%=wishList.get(i).getPost_category()%>')">
										<span>
											<svg>
												<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/>
											</svg>
										</span>
									</button>
								</div>
							<a href="PostDetail.jsp?post_num=<%=wishList.get(i).getPost_num()%>">
								<div>
									<div>????????? : <%=wishList.get(i).getMem_email() %></div>
									<div>?????? : <%=wishList.get(i).getPost_title() %></div>
									<div>?????? : <%=wishList.get(i).getPost_price() %></div>
									<div>
										<%
											double avg_strt = 0;
											for(int j = 0; j < starratingList.size(); j++) {
												if(wishList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
													avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
												}
											}
											out.print("<div>???|"+ String.format("%.1f", avg_strt)+"</div>");												
										%>
									</div>
								</div>
							</a>
						</article>
					<%} %>
				</div>
			</div>
		</div>
	</div>	
<%} %>
<!-- script -->	
	<!-- 2022-11-02 / ????????? / ?????? ????????? ?????? ?????? -->
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="./assets/js/SuggestWord.js"></script>
	
	<!-- 2022-11-07 / ????????? / ??? ?????? ?????? ?????? -->
	<script src="./assets/js/WishBtn.js"></script>
</body>
</html>