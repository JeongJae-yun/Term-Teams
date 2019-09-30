<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="cart.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>

<body>
<%request.setCharacterEncoding("utf-8"); %>
<div id="wrap">
 <div id="main_header">
    <div id="header1">
      <div class="menu1"><a href="company_info.jsp"><img src="images/회사.png" width="200" height="100" alt="menu1" /></a></div>
      <div class="menu2"><a href="clothesdetail.jsp"><img src="images/스토어.png" width="200" height="100" alt="menu2" /></a></div>
    </div>
    <div id="logo">
      <div class="mainlogo"><a href="main2.jsp"><img src="images/로고2.png" width="150" height="125" alt="mainlogo" /></a></div>
    </div>
    <div id="header2">
      <div id="submenu">
        <div class="login">
        <%
    String id = (String)session.getAttribute("UI");
	
%>
<c:set var ="id" value="<%=id %>"/>

	<c:if test = "${id == null}">
		<a href="customerlogin.jsp"><img src="images/로그인.png" width="105" height="46" alt="login" /></a>
	</c:if>  
	   
	<c:if test = "${id != null}">
		<a href="logout.jsp"><img src="images/로그아웃4.png" width="105" height="46" alt="logout" /></a>
	</c:if>
        </div>
        
        <div class="join"><a href="customerjoin.jsp"><img src="images/회원가입.png" width="121" height="46" alt="join" /></a></div>
        <div class="sns"><img src="images/이디야-메인페이지_06.jpg" width="153" height="46" alt="sns" /></div>
      </div>
      <div id="mainmenu">
        <div class="menu3"><a href="community.jsp"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="mypage.jsp"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="cartimg"><img src="images/카트img.jpg" width="1890" height="250" /></div>
    
    <div id="cart">
      <div id="carttop"><img src="images/20181108_154647.png" width="1200" height="78" /></div>
      
        
      
      
      <div id="cartlist">
      
        
      
     
            <%
            
           
            int clothesId =  Integer.parseInt(request.getParameter("clothesId"));        	
            int amount = Integer.parseInt(request.getParameter("amount"));        	                	        
            int price = Integer.parseInt(request.getParameter("price"));
        	
        	Cart cart = new Cart();
        	cart.setClothesId(clothesId);        	
        	cart.setPrice(price);
        	cart.setAmount(amount);
        	
        	
        	
        	Integer clothesCount = (Integer)session.getAttribute("clothesCount");
        	if (clothesCount == null)
        		clothesCount = new Integer(0);
        	if(clothesId != 0){
        		clothesCount = new Integer(clothesCount.intValue()+1);
        		session.setAttribute("clothesCount",clothesCount);
        		session.setAttribute("clothes"+clothesCount, cart); // the end
        	}
        	%>
        	
        	
        	
  <div class="fonta">      	 
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>상품이 장바구니에 담겼습니다.<br>
    </p>
        </div>
        <a href="/term/term/cart.jsp"> <input name="buy" type="submit" class="btn" id="buy" value="카트보기" /></a>
        <a href="/term/term/pay3.jsp"> <input name="buy" type="submit" class="btn" id="buy" value="바로구매하기" /></a>
        <a href="/term/term/clothesdetail.jsp"> <input name="buy" type="submit" class="btn" id="buy" value="쇼핑계속하기" /></a>
      </div>
    </div>
  </div>
  <div id="footer">
        <div id="footer_info">
          <p>경기도 시흥시 산기대학로 237 한국산업기술대학교 | TEL: 031-123-4567 | FAX: 031-123-4567</p>
          <p>사업자등록번호:123-45-6789 | 통신판매업 신고: 시흥 제 123456호 </p>
          <p>&copy;2018 Term &amp; Teams Clothes COMPANY. ALL RIGHTS RESERVED</p>
        </div>
      </div>

</body>
</html>
