<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>SearchMain</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/searchmain.css">
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
	UserDTO info = (UserDTO)session.getAttribute("info");
	String isExpert="";

	String userInput = request.getParameter("userInput");
	System.out.println(userInput);

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.searchPost(userInput);
	
	/* //if(info != null){
		WishListDAO w_dao = new WishListDAO();
		List<WishListDTO> wishList = w_dao.wishList(info.getEmail());

		ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();
		System.out.print("??? ??? ????????? ??????");
		for(int i = 0; i<wishList.size(); i++){
			whishPostNumList.add(wishList.get(i).getPost_num());
			System.out.print(whishPostNumList.get(i)+" ");
		}
		System.out.println();
		
		System.out.println("????????? ??????"+whishPostNumList.size());
	//} */
	
	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();
	
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
						<%
						}
						else{
						%>
							<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25">
								<b>?????????</b>
							</a>
							<a href="JoinSelect.jsp" class="flex-c-m trans-04 p-lr-25">
								<b>????????????</b>
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
	<main>
		<div class="search-area">
	        <div class="search-category">
	            <div id="category_all" class="search-category-all"><a href="SerchMain.jsp?postCategory=all&userInput=<%=userInput%>" class="click-category">????????????</a></div>
	            <div id="category_ots" class="search-category-web"><a href="SerchMain.jsp?postCategory=ots&userInput=<%=userInput%>" class="click-category">??????</a></div>
	            <div id="category_code" class="search-category-app"><a href="SerchMain.jsp?postCategory=code&userInput=<%=userInput%>" class="click-category">??????</a></div>
	        </div>
	        <div class="search-result-head">
	            <%=postList.size()%>?????? ????????? ?????? ??????
	        </div>
	        <div class="search-result-content">
	            <%
            	List<PostDTO> searchOtsPostList = new ArrayList<PostDTO>();
            	List<PostDTO> searchCodePostList = new ArrayList<PostDTO>();
            	PostDAO p_dao = new PostDAO();
            	for(PostDTO dto : postList){
            		PostDTO p_dto = p_dao.showPostDetail(dto.getPost_num());
            		if(p_dto.getPost_category().contains("ots"))
            			searchOtsPostList.add(p_dto);
            		else if(p_dto.getPost_category().contains("code"))
            			searchCodePostList.add(p_dto);
            	}
            	System.out.println("?????? ?????? : "+searchOtsPostList.size());
            	System.out.println("???????????? ?????? : "+searchCodePostList.size());
            	
            	List<PostDTO> resultList = new ArrayList<PostDTO>();
            	String postCategory = request.getParameter("postCategory");
            	if(postCategory == null)
            	{
            		resultList = postList;
            	}
            	else
            	{
	            	if(postCategory.equals("ots"))
	            	{
	            		resultList = searchOtsPostList;
	            	}
	            	else if(postCategory.equals("code"))
	            	{
	            		resultList = searchCodePostList;
	            	}
	            	else
	            	{
	            		resultList = postList;
	            	}
            	}
            	
            	for(int i = 0; i < resultList.size()/4+1; i++){
            		if(i*4 != resultList.size()){
            	%>
                <div class="search-result-content-row">
                	<%
            		}
            		for(int j = 0; j < 4; j++){
            			if(4*i+j == resultList.size()){
            				break;
            			}
	            		PostDTO post = new PostDAO().showPostDetail(resultList.get(4*i+j).getPost_num());
	            		PortfolioDTO pf = new PortfolioDAO().showImage(resultList.get(4*i+j).getMem_email());
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
								<button id="wish-btn<%=post.getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishClick('wishPostClick('<%=postList.get(4*i+j).getPost_num() %>', this.id)">
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
					if(i * 4 != resultList.size()){
				%>
                </div>
                <%
					}
           		}
				%>
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
	
	
	<%-- <div>
		<div>
		    <h3>??????</h3>
		    <form action="SerchMain.jsp" method="get">
		        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput">
		        <input type="submit" value="??????">
			    <ul id="suggest-list"></ul> 
		    </form>
		</div>
		<div>
			<h3>?????????</h3>
			<button>?????????</button>
			<a href="JoinSelect.jsp"><button>????????????</button></a>
		</div>
		<div>
			<h3>??????</h3>
			<a href="PostWrite.jsp">????????????</a> <a href="MyPage.jsp">???????????????</a>
			<ul>
				<li><a href="EditInfo.jsp">????????? ??????</a></li>
				<li><a href="EditPost.jsp">????????? ??????</a></li>
				<li><a href="ChatMain.jsp">??????</a></li>
				<li><a href="WishList.jsp">??? ??????</a></li>
				<li><a href="ReviewList.jsp">????????????</a></li>
				<li><a href="LogoutService.do">????????????</a></li>
			</ul>
		</div>
		<div>
			<a href="PostMain.jsp?postType=outsourcingPost">??????</a> <a
				href="PostMain.jsp?postType=codePost">????????????</a> <a
				href="SiteIntroduce.jsp">???????????????</a> <a href="FAQ.jsp">FAQ</a>
		</div>
		<section>
			<%=userInput%>??? ?????? ???????????????.
			<%System.out.print("post size : "+postList.size()); %>
		</section>
	
		<%if(postList.size()<1){%>
			<div>?????? ????????? ????????????.</div>
		<%} else {%>
			<div><%=postList.size() %>?????? ????????? ??????</div>
		<%} %>
		
		
		<div>
			<div>
				<div id="article-group">
					<%for(int i=0; i<postList.size();i++){%>
						<article id="article-tag<%=postList.get(i).getPost_num()%>">
								<div>??????: <%=postList.get(i).getPost_file() %></div>
								<div>
									<button id="wish-btn<%=postList.get(i).getPost_num()%>" onclick="wishPostClick('<%=postList.get(i).getPost_num() %>', this.id)">
										<span>
											<svg>
												<%for(int j = 0; j < whishPostNumList.size(); j++) {%>
													<%int compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
													<%if(compareResult == 0) {%>
														<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/>
													<%} else{%>
														<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>												
													<%} %>
												<%} %>
											</svg>
										</span>
									</button>
								</div>
							<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
								<div>
									<div>????????? : <%=postList.get(i).getMem_email() %></div>
									<div>?????? : <%=postList.get(i).getPost_title() %></div>
									<div>?????? : <%=postList.get(i).getPost_price() %></div>
									<div>
										<%
											double avg_strt = 0;
											for(int j = 0; j < starratingList.size(); j++) {
												if(postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
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
		
		
	</div> --%>

<!-- script -->
<script type="text/javascript">
	let categoryAll = document.getElementById("category_all");
	let categoryOts = document.getElementById("category_ots");
	let categoryCode = document.getElementById("category_code");
	if('<%=request.getParameter("postCategory")%>' == 'ots'){
		categoryAll.style.opacity = 0.5;
		categoryOts.style.opacity = 1;
		categoryCode.style.opacity = 0.5;
		categoryAll.style.fontWeight = 'normal';
		categoryOts.style.fontWeight = 'bold';
		categoryCode.style.fontWeight = 'normal';
	}
	else if('<%=request.getParameter("postCategory")%>' == 'code'){
		categoryAll.style.opacity = 0.5;
		categoryOts.style.opacity = 0.5;
		categoryCode.style.opacity = 1;
		categoryAll.style.fontWeight = 'normal';
		categoryOts.style.fontWeight = 'normal';
		categoryCode.style.fontWeight = 'bold';
	}
	else{
		categoryAll.style.opacity = 1;
		categoryOts.style.opacity = 0.5;
		categoryCode.style.opacity = 0.5;
		categoryAll.style.fontWeight = 'bold';
		categoryOts.style.fontWeight = 'normal';
		categoryCode.style.fontWeight = 'normal';
	}
</script>
<!-- 2022-11-02 / ????????? / ?????? ????????? ?????? ?????? -->
<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="./assets/js/SuggestWord.js"></script>

<!-- 2022-11-07 / ????????? / ??? ?????? ?????? ?????? -->
<script src="./assets/js/WishBtn.js"></script>
</body>
</html>