<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "my.model.*,my.dao.*,java.sql.*,my.util.*,java.util.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="clothesRegister.css" rel="stylesheet" type="text/css" />
</head>

<body>
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
  
<div id="page_center">
  <div class="registerform">
    <form action="clothesResult.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1">
      <table width="700" border="1" cellspacing="0" cellpadding="3">
        <tr>
          <th width="134" scope="row">제품 이름</th>
          <td width="548"><label for="clothesName"></label>
          <input type="text" name="clothesName" id="clothesName" /></td>
        </tr>
        <tr>
          <th scope="row">색상</th>
          <td><label for="color"></label>
          <input type="text" name="color" id="color" /></td>
        </tr>
        <tr>
          <th scope="row">사이즈</th>
          <td><label for="size"></label>
            <label for="size"></label>
            <label for="size2"></label>
            <input type="text" name="size" id="size2" /></td>
        </tr>
        <tr>
          <th scope="row">수량</th>
          <td><label for="amount"></label>
            <select name="amount" id="amount">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
            </select></td>
        </tr>
        <tr>
          <th scope="row">가격</th>
          <td><label for="price"></label>
          <input type="text" name="price" id="price" /></td>
        </tr>
         <tr>
          <th scope="row">옷 분류</th>
          <td><label for="type"></label>
          <select name="clothesType">
                        	<option value="outer">outer</option>
                        	<option value="T-shirt">T-shirt</option>
                        	<option value="pants">pants</option>
                        	<option value="acc">acc</option>
                        </select></td>
        </tr>
        <tr>
          <th scope="row">제품 대표 이미지</th>
          <td><input type="file" name="clothesImage" id="clothesImage" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지1</th>
          <td><label for="clothesImage1"></label>
          <input type="file" name="clothesImage1" id="clothesImage1" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지2</th>
          <td><label for="clothesImage2"></label>
          <input type="file" name="clothesImage2" id="clothesImage2" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지3</th>
          <td><label for="clothesImage3"></label>
          <input type="file" name="clothesImage3" id="clothesImage3" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지4</th>
          <td><label for="clothesImage4"></label>
          <input type="file" name="clothesImage4" id="clothesImage4" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지5</th>
          <td><label for="clothesImage5"></label>
          <input type="file" name="clothesImage5" id="clothesImage5" /></td>
        </tr>
        <tr>
          <th scope="row">제품 상세 이미지6</th>
          <td><label for="clothesImage6"></label>
          <input type="file" name="clothesImage6" id="clothesImage6" /></td>
        </tr>
         <tr>
          <th scope="row">제품 상세 이미지7</th>
          <td><label for="clothesImage7"></label>
          <input type="file" name="clothesImage7" id="clothesImage7" /></td>
        </tr>
        <tr>
          <th colspan="2" scope="row"><input type="submit" name="submit" id="submit" value="등록" />
          <input type="reset" name="cancle" id="cancle" value="취소" /></th>
        </tr>
      </table>
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
