<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PrchsDTO"%>
<%@page import="com.codeshot.model.PrchsDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">

<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/ReviewList.css">

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
		margin: 5px 0px 0px 0px;
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
  
  
.review-row {
	border-bottom: 1px solid #e6e6e6;
	padding: 15px;
}
}
.block-img-radius {
	border-radius: 5px;
}
.star-num {
	font-weight: bold;
	display: inline-block;
	margin-left: 7px;
    top: -4px;
    position: relative;
}
.review-content {
	margin-top: 15px;
}
.content-wrapper {
	margin-left: 15px;
}
.middle{
	width: 440px;
    line-height: 25px;
    padding: 33px;
}

.post_writer,  prch_date{
	font-size: 13px;
}

.end{
	width: 30%;
	padding: 72px;
}

.post_img{
	width: 200px;
	height: 160px;
	border-radius: 4px;
	margin: 17px;
	margin-right: 0px;
}
</style>


</head>
<body>
	<%
	System.out.println("[???????????? ?????????]");

	UserDTO info = (UserDTO) session.getAttribute("info");
	String isExpert = "";

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.showPost();
	PortfolioDTO pf;

	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();

	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = null;

	ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();

	//????????? ????????? ??????
	PrchsDAO p_dao = new PrchsDAO();
	List<PrchsDTO> prchList = p_dao.showPrchsList(info.getEmail());

	//???????????????????????? ??????
	/* ReviewDAO r_dao = new ReviewDAO(); */
	ReviewDTO showReview;

	System.out.println("?????????????????? : " + prchList.size());
	//System.out.println("??????????????? ????????? ?????? : " + showReviewList.size());
	%>

	<!-- Header -->
	<header class="container-menu-desktop">
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

						<!-- ????????? -->
						<%
						} else if (info == null) {
						%>
						<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25"> <b>?????????</b>
						</a> <a href="JoinSelect.jsp" class="flex-c-m trans-04 p-lr-25"> <b>????????????</b>
						</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</section>

		<section class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container codeShot-nav">
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
	<!-- ?????? -->
	<%
	if (info != null) {
	%>

	<!-- ????????? -->
	<%
	if ((isExpert = info.getIsExpert()).equals("Y")) {
	%>
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
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="EditInfo.jsp" target="_self"
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
										<div data-v-17364d77="" class="new-label-wrapper active">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? ????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? ?????? </span>
											</a>
										</div>
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
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="EditPost.jsp" class=""> ????????? ??????
									</a> <a data-v-17364d77="" href="#sellerProposals"
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
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? (<span data-v-17364d77="" class="NGB">0</span>)
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? (<span data-v-17364d77="" class="NGB">0</span>)
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? (<span data-v-17364d77="" class="NGB">0</span>)
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? (<span data-v-17364d77="" class="NGB">0</span>)
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? (<span data-v-17364d77="" class="NGB">0</span>)
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="PortfolioWrite.jsp" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										??????????????? ??????
										<!---->
										<!---->
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="ChatMain.jsp" target="_self"
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
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="LogoutService.do" target="_self"
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
			<div class="content-wrapper" style="width: 900px;">
				<div class="myTitle">??????????????? ??????</div>
				<div class="myBox">
					<div class="myContent">
						<%
						for (int i = 0; i < prchList.size(); i++) {
							if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) == 0) {
								for (int j = 0; j < postList.size(); j++) {
							if (postList.get(j).getPost_num().equals(prchList.get(i).getPost_num())) {
						%>
						<div class="rows">
								<div class="col-md-auto">
								<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						
						String category = "";
						PostDTO postInfo = dao.showPostDetail(prchList.get(i).getPost_num());
						category = postInfo.getPost_category();
						
						if(category.contains("ots"))
			        		category = category.replace("ots_", "??????/");
			        	else if(category.contains("code"))
			        		category = category.replace("code_", "????????????/");
			        	if(category.contains("web"))
			        		category = category.replace("web", "Web");
			        	else if(category.contains("app"))
			        		category = category.replace("app", "App");						%>
								<%
								if(pf != null){
	
								%>
									<img class="post_img" src="./file/<%= pf.getPf_file()%>" >
								<%}else if(pf == null){%>
									<img class="post_img" alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height="200px">	
								<%}%>
								</div>
								<div class="col-md-auto">
									<div class="middle">
										<div class="post_category"><%=category%></div>
										<div class="post_title"><%=postList.get(j).getPost_title()%></div>
										<div class="post_price"><%=postList.get(j).getPost_price()%>???</div>
										<div class="post_writer"><%=postList.get(j).getMem_email()%></div>
										<div class="prch_date"><%=sdf.format(prchList.get(i).getPrch_date())%></div>
									</div>
								</a>	
								</div>
							<div class="col-md-auto end">
								<a class="my_btn flex-c-m "
									href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>"><span>????????????</span></a>
							</div>
						</div>
						<%
						}
						}
						}
						}
						%>
					</div>
				</div>

				<div class="myTitle next">????????? ??????</div>
				<div class="myBox">
					<div class="myContent">
						<%
						for (int i = 0; i < prchList.size(); i++) {
							if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) > 0) {

								showReview = r_dao.showReview(new ReviewDTO(prchList.get(i).getPost_num(), info.getEmail()));

								for (int j = 0; j < postList.size(); j++) {
							if (postList.get(j).getPost_num().equals(showReview.getPost_num())) {
						%>
						<div class="rows">
							<div class="col-md-auto">
								<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						
						String category = "";
						PostDTO postInfo = dao.showPostDetail(prchList.get(i).getPost_num());
						category = postInfo.getPost_category();
						
						if(category.contains("ots"))
			        		category = category.replace("ots_", "??????/");
			        	else if(category.contains("code"))
			        		category = category.replace("code_", "????????????/");
			        	if(category.contains("web"))
			        		category = category.replace("web", "Web");
			        	else if(category.contains("app"))
			        		category = category.replace("app", "App");
						%>
								<%
								if(pf != null){
	
								%>
									<img class="post_img" src="./file/<%= pf.getPf_file()%>" >
								<%}else if(pf == null){%>
									<img class="post_img" alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height="200px">	
								<%}%>
								</div>
							<div class="col-md-auto">
								<div class="middle">
									<div class="post_category"><%=category%></div>
									<div class="post_title"><%=postList.get(j).getPost_title()%></div>
									<div class="post_price"><%=postList.get(j).getPost_price()%>???</div>
									<div class="post_writer"><%=postList.get(j).getMem_email()%></div>
									<div class="prch_date"><%=sdf.format(prchList.get(i).getPrch_date())%></div>
								</div>
							</a>
							</div>
							<div class="col-md-auto end">
								<a class="my_btn flex-c-m "
									href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>"><span>??????</span></a>
							</div>
						</div>
						<div class="review-row">
							<div class="review_starraiting">
								<%
								for (int k = 0; k < showReview.getReview_starrating().intValue(); k++) {
								%>
								<span class="review-icon"> 
								<img class="reivew-star" alt="???" src="./assets/cssImg/star-fill.svg" height = 22px>
								</span>
								<%
								}
								%>
								<div class="star-num">
									<span><%=showReview.getReview_starrating()%></span>
								</div>
							</div>
							<div class="review-content"><%=showReview.getReview_content()%></div>
						</div>
						<%
						}
						}
						}
						}
						%>



					</div>
				</div>
			</div>
	</main>

	<!-- ?????? -->
	<%
	} else if ((isExpert = info.getIsExpert()).equals("N")) {
	%>
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
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="EditInfo.jsp" target="_self"
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
										<div data-v-17364d77="" class="new-label-wrapper active">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? ????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													???????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? ????????? </span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													?????? </span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="ChatMain.jsp" target="_self"
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
									<a data-v-17364d77="" href="wishList.jsp" class=""> ??? ?????? </a> <a
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
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="LogoutService.do" target="_self"
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
			<div class="content-wrapper" style="width: 900px;">
				<div class="myTitle">??????????????? ??????</div>
				<div class="myBox">
					<div class="myContent">
						<%
						for (int i = 0; i < prchList.size(); i++) {
							if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) == 0) {
								for (int j = 0; j < postList.size(); j++) {
							if (postList.get(j).getPost_num().equals(prchList.get(i).getPost_num())) {
						%>
						<div class="rows">
							<div class="col-md-auto">
							<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						
						String category = "";
						PostDTO postInfo = dao.showPostDetail(prchList.get(i).getPost_num());
						category = postInfo.getPost_category();
						
						if(category.contains("ots"))
			        		category = category.replace("ots_", "??????/");
			        	else if(category.contains("code"))
			        		category = category.replace("code_", "????????????/");
			        	if(category.contains("web"))
			        		category = category.replace("web", "Web");
			        	else if(category.contains("app"))
			        		category = category.replace("app", "App");
						%>
								<%
								if(pf != null){
	
								%>
									<img class="post_img" src="./file/<%= pf.getPf_file()%>" >
								<%}else if(pf == null){%>
									<img class="post_img" alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height="200px">	
								<%}%>
								</div>
							<div class="col-md-auto">
								<div class="middle">
									<div class="post_category"><%=category%></div>
									<div class="post_title"><%=postList.get(j).getPost_title()%></div>
									<div class="post_price"><%=postList.get(j).getPost_price()%>???</div>
									<div class="post_writer"><%=postList.get(j).getMem_email()%></div>
									<div class="prch_date"><%=sdf.format(prchList.get(i).getPrch_date())%></div>
								</div>
							</div>
							</a>
							<div class="col-md-auto end">
								<a class="my_btn flex-c-m "
									href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>"><span>????????????</span></a>
							</div>
						</div>
						<%
						}
						}
						}
						}
						%>
					</div>
				</div>

				<div class="myTitle next">????????? ??????</div>
				<div class="myBox">
					<div class="myContent">
						<%
						for (int i = 0; i < prchList.size(); i++) {
							if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) > 0) {

								showReview = r_dao.showReview(new ReviewDTO(prchList.get(i).getPost_num(), info.getEmail()));

								for (int j = 0; j < postList.size(); j++) {
							if (postList.get(j).getPost_num().equals(showReview.getPost_num())) {
						%>
						<div class="rows">
							<div class="col-md-auto">
								<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						
						String category = "";
						PostDTO postInfo = dao.showPostDetail(prchList.get(i).getPost_num());
						category = postInfo.getPost_category();
						
						if(category.contains("ots"))
			        		category = category.replace("ots_", "??????/");
			        	else if(category.contains("code"))
			        		category = category.replace("code_", "????????????/");
			        	if(category.contains("web"))
			        		category = category.replace("web", "Web");
			        	else if(category.contains("app"))
			        		category = category.replace("app", "App");
						%>
								<%
								if(pf != null){
	
								%>
									<img class="post_img" src="./file/<%= pf.getPf_file()%>" >
								<%}else if(pf == null){%>
									<img class="post_img" alt="????????? ?????? ???" src="./assets/cssImg/?????????????????????.jpg" height="200px">	
								<%}%>
								</div>
							<div class="col-md-auto">
								<div class="middle">
									<div class="post_category"><%=category%></div>
									<div class="post_title"><%=postList.get(j).getPost_title()%></div>
									<div class="post_price"><%=postList.get(j).getPost_price()%>???</div>
									<div class="post_writer"><%=postList.get(j).getMem_email()%></div>
									<div class="prch_date"><%=sdf.format(prchList.get(i).getPrch_date())%></div>
								</div>
							</div>
							</a>
							<div class="col-md-auto end">
								<a class="my_btn flex-c-m "
									href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>"><span>??????</span></a>
							</div>
						</div>
						<div class="review-row">
							<div class="review_starraiting" >
								<%
								for (int k = 0; k < showReview.getReview_starrating().intValue(); k++) {
								%>
								<div class="review-icon"> 
								<img class="reivew-star" alt="???" src="./assets/cssImg/star-fill.svg" height = 22px>
								</div>
								<%
								}
								%>
								<div class="star-num">
									<span><%=showReview.getReview_starrating()%></span>
								</div>
							</div>
							<div class="review-content"><%=showReview.getReview_content()%></div>
						</div>
						<%
						}
						}
						}
						}
						%>



					</div>
				</div>
			</div>
	</main>

	<%
	}
	%>
	<%
	}
	%>

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


</body>
</html>