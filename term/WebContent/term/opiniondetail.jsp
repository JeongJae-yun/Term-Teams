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
<link href="community.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body,td,th {
	font-size: 25px;
	font-weight: bold;
}
</style>
<link href="write.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
</script>
</head>

<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="opinion" class="my.model.Opinion"/>
<jsp:setProperty property="*" name="opinion"/>


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
    <div id="mainimg">
      <div class="communitystyle" id="writetag">Opinion</div>
    </div>
    <div id="communitylist">
      <div id="buttonlist"></div>
      <div id="Qnalist"></div>
      <div class="logostyle" id="writelogo">고객님의 소중한 의견
      </div>
      <%
    int opinionId = Integer.parseInt(request.getParameter("opinionId"));
	Connection conn = ConnectionProvider.getConnection();
	Opinion opinion1 = null;
	try{
		OpinionDao dao = new OpinionDao(); 
		dao.updateAccessCount(conn, opinionId);
		opinion1 = dao.selectById(conn, opinionId);
	}catch(SQLException e){}
	finally { JdbcUtil.close(conn);}
			%>
	<c:set var="op" value="<%=opinion1%>"/>
      <div id="writeboard">
      <table width="600" cellpadding="3" cellspacing="0" id="writetable">
          <tr>
            <th width="88" height="59" scope="row">제목</th>
            <td width="614"><label for="title1">${op.title1 }</label>
            </td>
          </tr>
          <tr>
            <th height="53" scope="row"><p>이름</p></th>
            <td> ${op.userName1 }
            </td>
          </tr>
          <tr>
            <th height="56" scope="row">아이디</th>
            <td>${op.userId1 }
            </td>
          </tr>
          <tr>
            <th height="56" scope="row">분류</th>
            <td>${op.cate1 } </td>
          </tr>
          <tr>
            <th height="362" scope="row">내용</th>
            <td><label for="story"> ${op.story1 }</label>
            </td>
         
            
          </tr>
        </table>
        <a href="community.jsp"><input type ="button" class="btn" value="돌아가기"></input></a>
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
</body>
</html>
