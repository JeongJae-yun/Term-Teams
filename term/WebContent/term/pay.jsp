<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %> 
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
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    
    <div id="ordermain">
      <div id="ordertop">
        <div class="orderpay"><img src="images/20181107_230917.png" width="258" height="54" /></div>
        <div id="orderpay2"><img src="images/20181114_204006.png" width="257" height="50" /></div>
      </div>
      <div class="ordertop">
        <div class="orderpay"><img src="images/20181107_230950.png" width="184" height="46" /></div>
        
        <div id="proinfo">
          
  
         
          <table width="1035" border="1" align="center" cellpadding="3" cellspacing="0">
            <tr>
              <td width="80" bgcolor="#F8FBFC">상품코드</td>
              <td width="180" height="40" bgcolor="#F8FBFC">상품 이미지</td>
              <td width="375" bgcolor="#F8FBFC">상품명</td>
              <td width="55" bgcolor="#F8FBFC">수량</td>
              <td width="109" bgcolor="#F8FBFC">상품 금액</td>
              <td width="87" bgcolor="#F8FBFC">배송비</td>
              
            </tr>
               
               <%
               int clothesId = Integer.parseInt(request.getParameter("clothesId"));
           	   int amount = Integer.parseInt(request.getParameter("amount"));
           	   int price = Integer.parseInt(request.getParameter("price"));           	
               
               Buy buy = new Buy(id,clothesId,amount,amount*price,new java.util.Date());
               Connection conn = ConnectionProvider.getConnection();
             	Man man = null;
             	Clothes clothes = null;
             	
             	try{
             		ClothesDao cdao = new ClothesDao();
             		ManDao dao = new ManDao(); 
            		man = dao.selectById(conn, id);             	
		         	BuyDao bdao = new BuyDao();
		         	bdao.insert(conn,buy);
		         	clothes = cdao.selectById(conn,clothesId);
             	
             %>
           
                   
	            <tr>
	        	<c:set var="clothes" value="<%=clothes %>"/>     
	              <td >${clothes.clothesId}</td>
	              <td><img src="/term/term/clo/SS_${clothes.clothesImage}"></td>
	              <td height="100">${clothes.clothesName}</td>
	              <td><%=amount %></td>
	              <td><%=price %></td>
	              <td>0원</td>
	              
	            </tr>
          </table>
         	 
          
        </div>
      </div>
    </div>
     <% 
             	
		            } catch(SQLException e) {}
             	finally{ JdbcUtil.close(conn);}
              %>
    <div id="reciinfo">
      <div class="orderpay"><img src="images/20181107_231008.png" width="216" height="43" /></div>
    </div>
    <form id="form1" name="form1" method="post" action="payment.jsp">
    <div id="reciinfo2">   
    <c:set var="m" value = "<%= man%>"/> 
      <table width="1034" height="152" border="1" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="168" height="33" align="center" bgcolor="#F8FBFC" scope="row">주문인 성명</th>
          <td width="848">${m.name }</input></td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">주문인 휴대전화</th>
          <td>${m.phoneNumber}</td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">주문인 이메일</th>
          <td>${m.email}@${m.email2 }</td>
        </tr>
        <tr>
          <th height="35" align="center" bgcolor="#F8FBFC" scope="row">주문인 주소</th>
          <td>
           <textarea cols="50" rows="2">${m.address}</textarea>
          
          </td>
        </tr>
      </table>
    
    
    
      <p>&nbsp;</p>
      <table width="1034" height="222" border="1" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="168" height="33" align="center" bgcolor="#F8FBFC" scope="row">수령인 성명</th>
          <td width="848"><input id="name" name="name" value="${m.name }"></input></td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">수령인 휴대전화</th>
          <td><input id="phoneNumber" name="phoneNumber" value ="${m.phoneNumber}"></input></td>
        </tr>
        <tr>
          <th height="35" align="center" bgcolor="#F8FBFC" scope="row">수령인 주소</th>
          <td>
           <textarea name="address" id="address" cols="50" rows="2">${m.address}</textarea>
          
          </td>
        </tr>
        <tr>
          <th height="111" align="center" bgcolor="#F8FBFC" scope="row">배송 메모</th>
          <td>
            
            <textarea name="memo" id="memo" cols="50" rows="5"></textarea>
          </td>
        </tr>
      </table>
     </div> 
      <div id="pay">      
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
