<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "my.model.*,my.dao.*,java.sql.*,my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<style type="text/css">
</style>
<link href="clothesdetail1.css" rel="stylesheet" type="text/css" />
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
<div id="page_main"><img src="images/888889.PNG" width="1900" height="800" /></div>
<div id="search">
    <div class="outer">
      <p><a href="clothesdetailType.jsp?type=1">OUTER</a></p>
    </div>
  <div class="T-shirt">
    <p><a href="clothesdetailType.jsp?type=2">T-shirt</a></p>
  </div>
  <div class="pants">
    <p><a href="clothesdetailType.jsp?type=3">Pants</a></p>
  </div>
  <div class="acc">
    <p><a href="clothesdetailType.jsp?type=4">ACC</a></p>
  </div>
</div>
   <p>&nbsp;</p>
    <p>&nbsp;</p>
<div id="search1">

  <form method="post" name="search" id="search2">
    <select name= "keyField">
      <option value="0">---선택---</option>
      <option value="clothesName">제품명</option>
      <option value="color">색상</option>
      <option value="accesscount">조회수</option>
    </select>
    <input type="text" name="keyword"/>
    <input type="submit" name="button" id="button" value="검색" />
  </form>
</div>


<div id="clothesInfo">
<div id="outer"> 

			<%
			request.setCharacterEncoding("utf-8");
         	String keyField = request.getParameter("keyField");
         	String keyword = request.getParameter("keyword");
				
             Connection conn = ConnectionProvider.getConnection();
             List<Clothes> clothesList = null;
             try{
            	 
            	 ClothesDao dao = new ClothesDao();
            	 clothesList = dao.selectList(conn, keyField, keyword);
             }catch(SQLException e){}
             finally { JdbcUtil.close(conn);}
             %>  
             <c:set var = "list" value= "<%=clothesList %>"/>
              <c:forEach var= "clothes" items = "${list}">
  			<div class="outer1">
  			<a href="clothesInfo1.jsp?clothesId=${clothes.clothesId}">
              <img src="/term/term/clothes/${clothes.clothesImage}"/></a><hr></hr>
              제품명: ${clothes.clothesName}<br></br>
              가격: ${clothes.price}원
             
        </div>
          </c:forEach>
       
  </div>
</div>
 <script type="text/javascript">
	function searchCheck(frm){
		if(frm.keyword.value==""){
			alert("검색단어를 입력하세요.");
			frm.keyword.focus();
			return;
		}
			frm.submit();
	}
</script>

  
</body>
</html>
