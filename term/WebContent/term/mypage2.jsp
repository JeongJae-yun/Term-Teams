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
      <div class="mypagestyle" id="mypagelogo"> My Page </div>
    </div>
    <div id="private">
      <div class="joinstyle" id="joinlogo">개인정보</div>
   <p>&nbsp;</p>
   <div id="mainlogin">
   <%
   
   
	Connection conn = ConnectionProvider.getConnection();
	List<Buy> buyList = null;
	Man man = null;
	
	try{
		ManDao dao = new ManDao(); 
		
		man = dao.selectById(conn, id);
		BuyDao bdao = new BuyDao();
   		buyList = bdao.selectListById(conn, id);
   		
    
	}catch(SQLException e){
		e.printStackTrace();
	}finally{JdbcUtil.close(conn);}
%>

	<c:set var="m" value = "<%=man%>"/>
      <table width="100%" border="0" cellpadding="3" cellspacing="0" id="logintable">
        <tr>
          <th width="162" scope="row">아이디*</th>
          <td width="520"><label for="userId"></label>
           ${m.id}</td>
        </tr>
        <tr>
          <th scope="row">비밀번호*</th>
          <td><label for="password"></label>
           ${m.password}</td>
        </tr>
        <tr>
          <th scope="row">이름*</th>
          <td><label for="userName"></label>
           ${m.name}</td>
        </tr>
        <tr>
          <th scope="row">핸드폰번호*</th>
          <td><label for="phoneNumber"></label>
            ${m.phoneNumber}</td>
        </tr>
        <tr>
          <th scope="row">이메일</th>
          <td><label for="email"></label>
            ${m.email}
            @
              <label for="select"></label>
              ${m.email2}</td>
        </tr>
        <tr>
          <th scope="row"><p>광고 알림 </p>
            <p>수신여부*</p></th>
          <td><p>${m.agree}<br />
            </p></td>
        </tr>
        <tr>
          <th scope="row">주소*</th>
          <td><label for="address"></label>
            ${m.address}</td>
        </tr>
        </table>
    
  </div>
  </div>
  <c:set var = "list" value= "<%=buyList %>"/>
  
    <div id="purchase">
      <div class="joinstyle" id="joinlogo">구매내역</div>
      <p>&nbsp;</p>
      <div id="purchaselist"><table width="100%" border="0" cellpadding="3" cellspacing="0" id="purchasetable">
        <tr>
          <th width="162" height="40" scope="row">상품 번호</th>
          <th width="144">구매 수량</th>
          <th width="81">가격</th>
          <th width="219">구매일자</th>
        </tr>
        <c:forEach var= "buy" items = "${list}">
        <tr>
          <td scope="row">${buy.clothesId }</td>
          <td>${buy.amount }</td>
          <td>${buy.allprice }</td>
          <td>${buy.buyDate }</td>
        </tr>
       
        </c:forEach>
        </table>
        
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
