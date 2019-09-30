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
h1,h2,h3,h4,h5,h6 {
	font-family: "LG PC";
	font-weight: bold;
}
h1 {
	font-size: 25px;
	color: #000;
}
</style>
<link href="mypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
</script>
</head>

<body>
<div id="wrap">
  <div id="main_header">
    <div id="header1">
      <div class="menu1"><a href="#"><img src="images/회사.png" width="200" height="100" alt="menu1" /></a></div>
      <div class="menu2"><a href="#"><img src="images/스토어.png" width="200" height="100" alt="menu2" /></a></div>
    </div>
    <div id="logo">
      <div class="mainlogo"><img src="images/로고2.png" width="150" height="125" alt="mainlogo" /></div>
    </div>
    <div id="header2">
      <div id="submenu">
        <div class="login"><a href="customerlogin.html"><img src="images/로그인.png" width="105" height="46" alt="login" /></a></div>
        <div class="join"><a href="customerjoin.html"><img src="images/회원가입.png" width="121" height="46" alt="join" /></a></div>
        <div class="sns"><img src="images/이디야-메인페이지_06.jpg" width="153" height="46" alt="sns" /></div>
      </div>
      <div id="mainmenu">
        <div class="menu3"><a href="#"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="#"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="mainimg">
      <div class="mypagestyle" id="mypagelogo"> My Page </div>
    </div>
    <div id="private">
      <div class="joinstyle" id="joinlogo">Profile</div>
   <p>&nbsp;</p>
   <div id="mainlogin">
   
    <form id="form1" name="form1" method="post" action="">
      <table width="100%" border="0" cellpadding="3" cellspacing="0" id="logintable">
        <tr>
          <th width="162" scope="row">아이디*</th>
          <td width="520"><label for="userId"></label>
            userId</td>
        </tr>
        <tr>
          <th scope="row">비밀번호*</th>
          <td><label for="password"></label>
            password</td>
        </tr>
        <tr>
          <th scope="row">이름*</th>
          <td><label for="userName"></label>
            userName</td>
        </tr>
        <tr>
          <th scope="row">핸드폰번호*</th>
          <td><label for="phoneNumber"></label>
            phoneNumber</td>
        </tr>
        <tr>
          <th scope="row">이메일</th>
          <td><label for="email"></label>
            email
            @
              <label for="select"></label>
              select</td>
        </tr>
        <tr>
          <th scope="row"><p>광고 알림 </p>
            <p>수신여부*</p></th>
          <td><p>agree<br />
            </p></td>
        </tr>
        <tr>
          <th scope="row">주소*</th>
          <td><label for="address"></label>
            address</td>
        </tr>
        </table>
    </form>
  </div>
  </div>
    <div id="purchase">
      <div class="joinstyle" id="joinlogo">구매내역</div>
      <p>&nbsp;</p>
      <div id="purchaselist"><table width="100%" border="0" cellpadding="3" cellspacing="0" id="purchasetable">
        <tr>
          <th width="162" height="71" scope="row">구매 상품명</th>
          <th width="144">구매 수량</th>
          <th width="81">가격</th>
          <th width="219">구매일자</th>
        </tr>
        <tr>
          <td scope="row">productName</td>
          <td>amount</td>
          <td>price</td>
          <td>purchaseDate</td>
        </tr>
        <tr>
          <td scope="row">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td scope="row">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td scope="row">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td scope="row">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td scope="row">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        </table></div>
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
