<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import = "my.model.*, my.dao.*, java.sql.*, my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="main2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h1,h2,h3,h4,h5,h6 {
	font-family: "a옛날목욕탕B";
	font-weight: bold;
}
h1 {
	font-size: 36px;
	color: #4C4C4C;
	font-family: "a옛날목욕탕B";
	text-align: center;
}
</style>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
</head><body>


<div id="wrap">
   <div id="main_header">
    <div id="header1">
      <div class="menu1"><a href="company_info.jsp"><img src="images/회사.png" width="200" height="100" alt="menu1" /></a></div>
      <div class="menu2"><a href="clothesdetail.jsp"><img src="images/스토어.png" alt="menu2" width="200" height="100" onclick="MM_openBrWindow('popup1.html','','width=400,height=304')" /></a></div>
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
        
        <div class="join">
        <c:if test = "${id == null}">
			<a href="customerjoin.jsp"><img src="images/회원가입.png" width="121" height="46" alt="join" /></a>
		</c:if>  
	   
		<c:if test = "${id != null}">
			${id }님 
			환영합니다.
		</c:if>
       
        </div>
        <div class="sns"><img src="images/이디야-메인페이지_06.jpg" width="153" height="46" alt="sns" /></div>
      </div>
      <div id="mainmenu" onfocus="MM_openBrWindow('popup.html','popup','')">
        <div class="menu3"><a href="community.jsp"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="mypage.jsp"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main" onblur="MM_openBrWindow('popup.html','popup','menubar=yes,width=450,height=300')">
    <div id="main_banner"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('1','','images/3421.PNG',1)"><img src="images/322.PNG" width="1700" height="757" id="1" /></a></div>

   
    <p>&nbsp;</p>
    <div id="m-banner">
      <div class="m_ban1"><img src="images/1.PNG" width="400" height="400" /></div>
      <div class="m_ban2"><a href="clothesInfo1.jsp?clothesId=1" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('2','','images/4-1.PNG',0)"><img src="images2/2.PNG" width="400" height="400" id="2" /></a></div>
      <div class="m_ban3"><a href="clothesInfo1.jsp?clothesId=2" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('3','','images/5-1.PNG',1)"><img src="images2/444.PNG" width="400" height="400" id="3" /></a></div>
      <div class="m_ban4"><a href="clothesInfo1.jsp?clothesId=3" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('4','','images/3-1.PNG',0)"><img src="images2/3.jpg" width="400" height="400" id="4" /></a></div>
      <div class="m_ban1"><a href="clothesInfo1.jsp?clothesId=4" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('5','','images/6-1.PNG',0)"><img src="images2/5555.PNG" width="400" height="400" id="5" /></a></div>
      <div class="m_ban2"><a href="clothesInfo1.jsp?clothesId=5" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('6','','images/7-1.PNG',0)"><img src="images2/6666.PNG" width="400" height="400" id="6" /></a></div>
      <div class="m_ban3"><a href="clothesInfo1.jsp?clothesId=6" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('7','','images/9-1.PNG',0)"><img src="images2/7777.PNG" width="400" height="400" id="7" /></a></div>
      <div class="m_ban4"><a href="clothesInfo1.jsp?clothesId=7" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('8','','images/10-1.PNG',1)"><img src="images2/8888.PNG" width="400" height="400" id="8" /></a></div>
      <div class="m_ban1"><a href="clothesInfo1.jsp?clothesId=8" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('9','','images/11-1.PNG',1)"><img src="images2/10.PNG" width="400" height="400" id="9" /></a></div> 
      <div class="m_ban2"><a href="clothesInfo1.jsp?clothesId=9" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('10','','images/12-1.PNG',1)"><img src="images2/11.PNG" width="400" height="400" id="10" /></a></div>
      <div class="m_ban3"><a href="clothesInfo1.jsp?clothesId=10" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('11','','images/121.PNG',1)"><img src="images2/12.PNG" width="400" height="400" id="11" /></a></div>
      <div class="m_ban4"><a href="clothesInfo1.jsp?clothesId=11" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('12','','images/8-1.PNG',1)"><img src="images2/9.PNG" width="400" height="400" id="12" /></a></div>
          
    </div>
   
   
    <div id="m-banner2">
      <div class="termteams">term &amp; teams clothes</div>
    </div>
    <div id="m-baaner2-1">
      <h4>Accessories you'll love</h4>
    </div>
    <div id="m-banner3">
      <div class="m_ban1"><a href="clothesInfo1.jsp?clothesId=12" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('13','','images/13-1.PNG',1)"><img src="images/13.PNG" width="400" height="400" id="13" /></a></div>
      <div class="m_ban2"><a href="clothesInfo1.jsp?clothesId=13" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('14','','images/14-1.PNG',1)"><img src="images/14.PNG" width="400" height="400" id="14" /></a></div>
      <div class="m_ban3"><a href="clothesInfo1.jsp?clothesId=14" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('15','','images/15-1.PNG',1)"><img src="images/15.PNG" width="400" height="400" id="15" /></a></div>
      <div class="m_ban4"><a href="clothesInfo1.jsp?clothesId=15" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('16','','images/16-1.PNG',1)"><img src="images/16.PNG" width="400" height="400" id="16" /></a></div></div>
    <div id="product">
      <div class="new_clothes">foreign country brand Clothes</div>
      <div id="newproduct">
        <div class="clothes1"><a href="clothesInfo1.jsp?clothesId=23"><img src="images/small_2.jpg" alt="사진1" name="Image2" width="350" height="420" id="Image2" onmouseover="MM_swapImage('Image2','','images/12345.PNG',1)" onmouseout="MM_swapImgRestore()" /></a></div>
        <div class="clothes1"><a href="clothesInfo1.jsp?clothesId=20" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image16','','images/6531.PNG',1)"><img src="images/small_6.jpg" width="350" height="420" id="Image16" /></a></div>
        <div class="clothes1"><a href="clothesInfo1.jsp?clothesId=21" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image20','','images/4321567.PNG',0)"><img src="images/small_11.jpg" width="350" height="420" id="Image20" /></a></div>
        <div class="clothes1"><a href="clothesInfo1.jsp?clothesId=22" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image18','','images/645.PNG',1)"><img src="images/small-5.jpg" width="350" height="420" id="Image18" /></a></div>
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
      
</div>
</div>
</body>
</html>
