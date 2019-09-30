<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import = "my.model.*, my.dao.*, java.sql.*, my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
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
        <div class="menu3"><a href="community.jsp"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="mypage.jsp"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="mainimg">
      <div class="mypagestyle" id="mypagelogo"> Our Customer </div>
    </div>
   
   
   <%
   
   
	Connection conn = ConnectionProvider.getConnection();
	List<Pocket> pocketList = null;
	
	try{
	
		PocketDao pdao = new PocketDao();
   		pocketList = pdao.selectList(conn);
    
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

	
  <c:set var = "list" value= "<%=pocketList %>"/>
    <div id="purchase">
      <div class="joinstyle" id="joinlogo">구매내역</div>
      <p>&nbsp;</p>
      <div id="purchaselist"><table width="100%" border="0" cellpadding="3" cellspacing="0" id="purchasetable">
        <tr>
          <th width="130" height="40" sczope="row">아이디</th>
          <th width="140">카드번호</th>
          <th width="145">카드사</th>
          <th width="125">지불금액</th>
          <th width="170">구매일자</th>
        </tr>
        <c:forEach var= "p" items = "${list}">
        <tr>
          <td scope="row">${p.id }</td>
          <td>${p.cardId }</td>
          <td>${p.cardCompany }</td>
          <td>${p.allprice2 }원</td>
          <td>${p.pocketDate}</td>
        </tr>
       
        </c:forEach>
        </table>
        
        </div>
    </div>
  
  
</body>
</html>
