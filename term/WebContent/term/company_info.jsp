<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import = "my.model.*, my.dao.*, java.sql.*, my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="company_info.css" rel="stylesheet" type="text/css" />
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
  <p>&nbsp;</p>
  <div id="middle_image">
    <div class="image_title">Term &amp; Teams Clothes</div></div>
  <div id="company_info">
    <h1>Term &amp; Teams Clothes </h1>
    <h4>&quot;Always around of you&quot;</h4>
    <h3>언제나 함께하는 Term &amp; Teams Clothes가 되겠습니다.</h3>
    <p>&nbsp; </p>
    <blockquote>
      <h2 align="left">◎vision</h2>
      <p align="left"> 브랜드와 소비자 모두가 만족할 수 있는 플랫폼을 갖춘 한국 최대의 패션 커머스 기업</p>
    </blockquote>
    <p align="left">&nbsp;</p>
    <blockquote>
      <h2 align="left">◎History </h2>
      <p align="left">-2018 term &amp; teams clothes 개설 </p>
    </blockquote>
    <p align="left">&nbsp;</p>
    <blockquote>
      <h2 align="left">◎Goals</h2>
      <p align="left"> -글로벌 플랫폼 구축</p>
      <p align="left">-2030년 연간 거래액 1000억 달성</p>
      <p align="left">-연간 매출 50억 규모 파트너 브랜드 50개 육성</p>
    </blockquote>
    <p align="center">&nbsp;</p>
    <blockquote>
      <h2 align="left">◎Strength</h2>
      <p align="left">-적극적 기술 개발 투자</p>
      <p align="left">-패션 전문가 그룹</p>
      <p align="left">-상품과 콘텐츠의 결합</p>
      <p>&nbsp;</p>
    </blockquote>
    
    <div id="info_sub">
      <div class="sub_image"><img src="images/dht.jpg" width="400" height="80" /></div>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>옷을 좋아하는 사람들이 모여 만든 <span lang="EN-US" xml:lang="EN-US">Term &amp; Teams Clothes</span></p>
      <p>
        <![if !supportEmptyParas]>
  &nbsp;
  <![endif]>
      </p>
      <p>합리적인 가격과 서비스로 높은 만족도를 추구합니다<span lang="EN-US" xml:lang="EN-US">.</span></p>
      <p>
        <![if !supportEmptyParas]>
  &nbsp;
  <![endif]>
      </p>
      <div id="footer">
        <div id="footer_info">
          <p>경기도 시흥시 산기대학로 237 한국산업기술대학교 | TEL: 031-123-4567 | FAX: 031-123-4567</p>
          <p>사업자등록번호:123-45-6789 | 통신판매업 신고: 시흥 제 123456호 </p>
          <p>&copy;2018 Term &amp; Teams Clothes COMPANY. ALL RIGHTS RESERVED</p>
        </div>
      </div>
    </div>
  </div>
  <div class="company_info2">
    <div class="info_image"></div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
