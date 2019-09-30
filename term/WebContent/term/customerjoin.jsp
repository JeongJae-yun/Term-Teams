<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import = "my.model.*, my.dao.*, java.sql.*, my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h2 {
	font-size: 16px;
	color: #000;
}
#apDiv1 {
	position: absolute;
	left: 477px;
	top: 530px;
	width: 963px;
	height: 784px;
	z-index: 1;
	overflow: hidden;
}
</style>
<link href="join.css" rel="stylesheet" type="text/css" />
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
</div><div id="main">
  <div id="joinimage">
    <div class="logostyle" id="imagelogo">Join us</div>
  </div>
  <div class="joinlogostyle" id="joinlogo">회원가입</div>
  <div id="mainjoin">
  <form id="form1" name="form1" method="post" action="joinResult.jsp">
    <table width="100%" cellpadding="3" cellspacing="0" id="jointable">
      <tr>
        <th width="29%" scope="row">아이디</th>
        <td width="71%"><span><input name="id" type="text" id="id" /></span></td>
      </tr>
      <tr>
        <th scope="row">비밀번호</th>
        <td><span><input name="password" type="text" id="password"/></span>
        </td>
      </tr>
      <tr>
        <th scope="row">이름</th>
        <td><span><input name="name" type="text" id="name"/></span></td>
      </tr>
      <tr>
        <th scope="row">핸드폰 번호</th>
        <td><span><input name="phoneNumber" type="text" id="phoneNumber"/>
        </span></td>
      </tr>
      <tr>
        <th scope="row">이메일</th>
        <td><span><input name="email" type="text" id="email"/></span>@<span><select name="email2" id="email2">
          <option value="naver.com">naver.com</option>
          <option value="daum.net">daum.net</option>
          <option value="gmail.com">gmail.com</option>
        </select></span></td>
      </tr>
      <tr>
        <th height="100" scope="row" ><p>광고 알람</p>
          <p>수신 여부</p></th>
        <td><p>
          <label>
            <input type="radio" name="agree" value="동의" id="agree" />
            동의</label>
          <br />
          <label>
            <input type="radio" name="agree" value="거부" id="agree" />
            거부</label>
          <br />
        </p>          <span></span></td>
      </tr>
      <tr>
        <th scope="row">주소</th>
        <td><span><textarea name="address" cols="" rows="" id="address"></textarea></span></td>
      </tr>
      <tr>
        <td colspan="2" align="center" scope="row">
        <input name="insert" type="submit" class="btnstyle" id="insert" value="입력 완료" /> 
          </td>
        </tr>
    </table>
  </form></div>
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
