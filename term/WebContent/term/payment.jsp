<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "my.model.*,my.dao.*,java.sql.*,my.util.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="pay1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#wrap #main #ordermain .ordertop #proinfo ul {
	color: #666;
}
</style>
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
    <div id="orderimg"><img src="images/주문img.jpg" width="1896" height="253" /></div>
    <%
   
    String name = request.getParameter("name");
    int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
    String address = request.getParameter("address");
    String memo = request.getParameter("memo");

   	Connection conn = ConnectionProvider.getConnection();
   	List<Buy> buyList = null;
   	
   	try{
   		BuyDao bdao = new BuyDao();
   		buyList = bdao.selectListById(conn, id);
   	}catch(SQLException e)
   	{
   		e.printStackTrace();
   	}finally{ JdbcUtil.close(conn);
   	
   	}
%>
    
    <div id="reciinfo">
      <div class="paymentstyle">결제 진행</div>
    </div>
    <form action="insertpay.jsp" method ="post">
    <c:set var="list" value = "<%= buyList%>"/> 
    
    <div id="reciinfo2">
      <table width="1034" height="256" border="1" align="center" cellpadding="3" cellspacing="0">
      
      <%int list_i = 0; %>
      <c:forEach var= "b" items = "${list}" begin = "<%=list_i%>">
      <tr>
          <th width="168" height="33" align="center" bgcolor="#F8FBFC" scope="row"><strong><%=list_i+1%>번째 상품 결제 가격</strong></th>
          <td width="848">
           ${b.allprice}
         </td>
        </tr>
        
       
        <input name = "allprice<%=list_i%>" type= "hidden" class = "allprice2" value = "${b.allprice}"/>
        <%list_i++; %>
      </c:forEach> 
	 	<input name = "price_length" value = "<%=list_i%>" type= "hidden" />
        <tr>
          <th width="168" height="33" align="center" bgcolor="#F8FBFC" scope="row">카드번호</th>
          <td width="848">
          
            <input name="cardId" type="text" id="cardId" size="25" placeholder=" '-' 을 제외하고 입력해주세요."/>
         </td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">카드사 선택</th>
          <td>
           
            <select name="cardCompany" id="cardCompany">
              <option value="신한은행">신한은행</option>
              <option value="국민은행">국민은행</option>
              <option value="기업은행(구 외환은행)">기업은행(구 외환은행)</option>
              <option value="새마을금고">새마을금고</option>
              <option value="부산은행">부산은행</option>
              <option value="대구은행">대구은행</option>
              <option value="우리은행">우리은행</option>
              <option value="카카오뱅크">카카오뱅크</option>
            </select>
         </td>
        </tr>
        <tr>
          <th height="34" align="center" bgcolor="#F8FBFC" scope="row">할부기간</th>
          <td>
           
            <select name="halbu" id="halbu">
              <option value="일시불">일시불</option>
              <option value="3개월할부">3개월할부</option>
              <option value="6개월할부">6개월할부</option>
            </select>
          </td>
        </tr>
        <tr>
          <th height="35" align="center" bgcolor="#F8FBFC" scope="row">품절 시 처리방법</th>
          <td>
            <p>
              <label>
                <input type="checkbox" name="soldout" value="환불" id="soldout" />
                환불</label>
              <label>
                <input type="checkbox" name="soldout" value="교환" id="soldout" />
                교환</label>
              <br />
            </p>
         </td>
        </tr>
      </table>
    </div>
    <div id="payment"></div>
    <div id="pay">
      <input name = "name" id ="name" value = "<%=name %>" type= "hidden" />
      <input name = "phoneNumber" id="phoneNumber" value = "<%=phoneNumber %>" type= "hidden" />
      <input name = "address" id="address" value = "<%=address %>" type= "hidden" />
      <input name = "memo" id="memo" value = "<%=memo %>" type= "hidden" />
      
      
        <input name="pay" type="submit" class="btn" id="pay2" value="결제하기" />
    </div>
    </form>
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
