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
<% request.setCharacterEncoding("utf-8"); %>
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
        <div class="menu3"><a href="#"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="#"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="cartimg"><img src="images/카트img.jpg" width="1890" height="250" /></div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="cart">
      <div id="carttop"><img src="images/20181108_154647.png" width="1200" height="78" /></div>
      <div id="carttop2">
        <div class="cart"><img src="images/20181108_155702.png" width="83" height="42" /></div>
      </div>
     
      <form id="form" name="form" method="post" action="clothesdetail.jsp">
      <div id="cartlist">
     
           
        <table width="100%" height="480" border="1" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <th width="83" height="50" bgcolor="#F8FBFC" scope="row">상품고유번호</th>
            <td width="100" bgcolor="#F8FBFC"><strong>상품이미지</strong></td>
            <td width="300" bgcolor="#F8FBFC"><strong>상품명</strong></td>
            <td width="80" bgcolor="#F8FBFC"><strong>수량</strong></td>
            <td width="130" bgcolor="#F8FBFC"><strong>상품금액</strong></td>            
            <td width="107" bgcolor="#F8FBFC"><strong>배송비</strong></td>
          </tr>
           <%
             	Connection conn = ConnectionProvider.getConnection();
             	int clothesCount = (Integer)session.getAttribute("clothesCount");
             	Clothes clothes = null;
             	try{
             	for (int i =1; i <=clothesCount; i++){
             		Cart cart = (Cart)session.getAttribute("clothes"+i);
             		int clothesId = cart.getClothesId();             		
             		int amount = cart.getAmount();
             		int price = cart.getPrice();
             		
             		ClothesDao dao = new ClothesDao();
             		clothes = dao.selectById(conn,clothesId);
             	
             %>
          <c:set var="clothes" value="<%=clothes %>"/>
		          <tr>
		            <th scope="row">${clothes.clothesId }</th>
		            <td><img src="/term/term/clo/SS_${clothes.clothesImage}"/></td>            
		            <td>${clothes.clothesName}</td>  
		            <td> <%=amount%>개</td>            
		            <td><%=price%>원</td>           
		            <td>무료!</td>
		          </tr>
          <% 
             	}
             	}catch(SQLException e) {}
             	finally{JdbcUtil.close(conn);}
              %>
          
        </table>
      </div>
        
      
        <input name="buy" type="submit" class="btn" id="buy" value="돌아가기" />
      </form>
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
