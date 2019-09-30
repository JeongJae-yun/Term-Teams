<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import = "my.model.*, my.dao.*, java.sql.*, my.util.*, java.util.*" %>
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
</style>
<link href="login.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h3 {
	font-size: 33px;
	color: #000;
}
</style>
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
     
	   
	
		<a href="logout.jsp"><img src="images/로그아웃4.png" width="105" height="46" alt="logout" /></a>
	
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
  
 
  <div id="maincontext">
    <div class="loginstyle" id="loginlogo">
      Welcome</div>
    <div id="mainlogin"><table width="700" cellpadding="3" cellspacing="0" id="loginresult">
  <tr>
  
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	Connection conn = ConnectionProvider.getConnection();
	String dbPassword = null;
	try{
		ManDao dao = new ManDao();
		dbPassword = dao.selectPasswordById(conn, id);
	}catch(SQLException e){}
	finally { JdbcUtil.close(conn); }
	if (id != null){
		if(password.equals(dbPassword)== true){
			session.setAttribute("UI", id);
			
		} else {
			
%>
	<script>
		alert("패스워드가 일치하지 않습니다.");
		history.go(-1);
	</script>
<% 			
		}
	}else{
%>
	<script>
		alert("해당하는 사용자 아이디가 없습니다.");
		history.go(-1);
	</script>
<%		
	}
%>  

    <td height="55" align="center">                    
    
  </tr>
  
  <%
    

    if("admin".equals(id)){
    	%>
    	
	  <tr>
	    <td align="center">
	    <form id="form2" name="form2" method="post" action="check.jsp">
	      <input name="mypage" type="submit" class="btn2style" id="mypage" value="고객주문 확인" />
	    </form></td>
	  </tr>
     <tr>
	    <td align="center">
	    <form id="form2" name="form2" method="post" action="clothesRegister1.jsp">
	      <input name="mypage" type="submit" class="btn2style" id="mypage" value="상품 등록하기" />
	    </form></td>
	  </tr>
    	<%

    }else{
		%>
  	 <tr>
	    <td align="center"><form id="form1" name="form1" method="post" action="main2.jsp"> 
	        <input name="mainshopping" type="submit" class="btn2style" id="mainshopping" value="쇼핑하러 가기" />
	      </form></td>
	  </tr>
	  <tr>
	    <td align="center">
	    <form id="form2" name="form2" method="post" action="mypage.jsp">
	      <input name="mypage" type="submit" class="btn2style" id="mypage" value="My Page로 가기" />
	    </form></td>
	  </tr>
<%
    }
%>

</table>

</div>
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
