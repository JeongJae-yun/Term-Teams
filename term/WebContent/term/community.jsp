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
	font-size: 18px;
	font-weight: bold;
	text-align: center;
}
</style>
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
      <div id="mainmenu">
        <div class="menu3"><a href="community.jsp"><img src="images/커뮤니티.png" width="250" height="100" alt="menu3" /></a></div>
        <div class="menu4"><a href="mypage.jsp"><img src="images/마이페이지.png" width="200" height="100" alt="menu4" /></a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="mainimg">
      <div class="communitystyle" id="communitylogo"><strong>Community</strong></div>
    </div>
    <div id="communitylist">
      <div id="buttonlist">
        <div class="buttonstyle" id="notice">Bulletin Board 
            
        </div>
      </div>
  
             
      <div id="Qnalist"></div><div id="write"><a href="write.jsp">글 작성하기</a></div>
      <div id="boardlist">
      				<%
      					
      					String userId = (String)session.getAttribute("UI");
      					String keyField = request.getParameter("keyField");
      	         		String keyword = request.getParameter("keyword");
                    	Connection conn = ConnectionProvider.getConnection();
                    	List<Opinion> opinionlist = null;
                    	
                    	try {
                    		OpinionDao dao = new OpinionDao();      
                    		
                    		opinionlist = dao.selectList(conn, keyField, keyword);                    		
                    	}	catch (SQLException e){
                    		e.printStackTrace();
                    	}
                    	finally{ JdbcUtil.close(conn);
                    	
                    	}
                    %>
                    <c:set var="list" value="<%=opinionlist%>"/>	
          			<c:set var ="userId" value="<%=userId %>"/>
        <table width="100%" cellpadding="3" cellspacing="0" id="bulletiontable">
          <tr>
            <th width="50" align="center" scope="col"><strong>번호</strong></th>
            <th width="50" scope="col"><strong>분류</strong></th>
            <th width="500" scope="col"><strong>제목</strong></th>
            <th width="108" scope="col"><strong>작성자</strong></th>
            <th width="200" scope="col"><strong>작성일자</strong></th>
            <th width="130" scope="col"><strong>상세보기</strong></th>
            <th width="50" scope="col"><strong>조회수</strong></th>
          </tr>
          <c:forEach var="op" items="${list}">
          <tr>
            <td>${op.opinionId}</td>
            <td>${op.cate1}</td>
            <td>${op.title1}</td>
            <td>${op.userName1}</td>
            <td>${op.registerTime}</td>
 			<c:if test="${userId != null}" >
                    <td><a href ="opiniondetail.jsp?opinionId=${op.opinionId }">상세보기</a></td>	
            </c:if>
            <c:if test="${userId == null}" >
                    <td><a href ="customerlogin.jsp">로그인
                    하러가기</a></td>	
            </c:if>
            </td>
            <td>${op.accesscount}</td>
          </tr>
           </c:forEach>
        
        </table>
        <form name="search" method="post">
              <select name= "keyField">
              	<option value="0">---선택---</option>
              	<option value="cate1">분류</option>
              	<option value="title1">제목</option>
              	<option value="userName1">작성자</option>
              </select>
            <input type="text" name="keyword" placeholder="검색어를 입력하세요."/>
            <input type="button" value="검색" onclick="searchCheck(form)"/> 
             </form>
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
