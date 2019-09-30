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
      
      <div id="cartlist">
      
        <table width="100%" height="480" border="1" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <th width="83" height="50" bgcolor="#F8FBFC" scope="row">번호</th>
            <td width="100" bgcolor="#F8FBFC">
              	<strong>상품이미지</strong>
            </td>
            <td width="450" bgcolor="#F8FBFC"><strong>상품명</strong></td>
            <td width="61" bgcolor="#F8FBFC"><strong>수량</strong></td>
            <td width="109" bgcolor="#F8FBFC"><strong>주문금액</strong></td>
            <td width="115" bgcolor="#F8FBFC"><strong>주문관리</strong></td>
            <td width="107" bgcolor="#F8FBFC"><strong>배송비</strong></td>
          </tr>
          <tr>
            <th scope="row">상품번호</th>
            <td>
              	상품이미지
          </td>            
            <td>상품명</td>            
            <td>           
              	수량
            </td>            
            <td>주문금액</td>
            <td>
              <input type="reset" name="delete" id="delete" value="삭제" />
            </td>
            <td>2500원</td>
          </tr>
          <tr>
            
            
        </table>
      </div>
     
            <%
        	int clothesId =  Integer.parseInt(request.getParameter("clothesId"));
        	int amount = Integer.parseInt(request.getParameter("amount"));        	        
        	Cart cart = new Cart(); // 기본생성자와 setter이용해서 객체 생성
        	cart.setClothesId(clothesId);
        	cart.setAmount(amount);
        	
        	Integer clothesCount = (Integer)session.getAttribute("clothesCount");
        	if (clothesCount == null)
        		clothesCount = new Integer(0);
        	if(clothesId != 0){
        		clothesCount = new Integer(clothesCount.intValue()+1);
        		session.setAttribute("clothesCount",clothesCount);
        		session.setAttribute("clothes"+clothesCount, cart); 
        	}        
        	%>
      장바구니에 담겼습니다.<br>
        <a href="/term/term/cart.jsp"> <input name="buy" type="submit" class="btn" id="cart" value="카트보기" /></a>
        <a href="/term/term/clothesdetail.jsp"> <input name="buy" type="submit" class="btn" id="buy" value="쇼핑계속하기" /></a>
      
    </div>
  </div>
  <div id="page_footer">
    <div id="footer1">
      <div class="footerlogo"><img src="images/이디야-footer_06.jpg" width="333" height="54" alt="footerlogo" /></div>
    </div>
    <div id="footer2">
      <div class="footermain"><img src="images/이디야-footer_13.jpg" width="956" height="133" alt="footermain" /></div>
    </div>
  </div>
</div>


</body>
</html>
