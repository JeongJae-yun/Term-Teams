<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="pay.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#wrap #main #ordermain .ordertop #proinfo ul {
	color: #666;
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
              <td width="638" height="35" bgcolor="#F8FBFC"><strong>상품 정보</strong></td>
              <td width="55" bgcolor="#F8FBFC">수량</td>
              <td width="109" bgcolor="#F8FBFC">상품 금액</td>
              <td width="87" bgcolor="#F8FBFC">배송비</td>
              <td width="105" bgcolor="#F8FBFC">주문금액</td>
            </tr>
        
             <%
            	Integer clothesCount = (Integer)session.getAttribute("clothesCount");
      			
             	Connection conn = ConnectionProvider.getConnection();
             	Clothes clothes = null;
             	Man man = null;
             	
             	try{
             		ManDao mdao = new ManDao();
                 	man = mdao.selectById(conn, id);
                 	ClothesDao cdao = new ClothesDao();
                 	BuyDao bdao = new BuyDao();
            		
		            for (int i =1; i <=clothesCount.intValue(); i++){
		                 Cart cart = (Cart)session.getAttribute("clothes"+i);
		                 int clothesId = cart.getClothesId();
		                 int amount = cart.getAmount();		                              		                 
               		  	 clothes = cdao.selectById(conn,clothesId);
               		 	 Buy buy = new Buy(id,clothesId,amount,amount*clothes.getPrice(),new java.util.Date());               		 	
          				 bdao.insert(conn, buy);
          				
             	%>
                
               
	            <tr>
	             <c:set var="clothes" value="<%=clothes %>"/>    
	              <td height="100">${clothes.clothesName}</td>
	              <td><%=amount %></td>
	              <td>${clothes.price}</td>
	              <td>0원</td>
	              <td></td>
	            </tr>
	            <% 
             	}
             	}catch(SQLException e)  {}
             	finally{ JdbcUtil.close(conn);}
              %>
          </table>
          
          <ul>
            <li>- 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
            <li>- 텀앤팀스 클로즈는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 전 지역, 전 상품 무료배송입니다.</li>
            <li>- 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
            <li>- 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.      </li>
          </ul>
        </div>
      </div>
    </div>
    <div>
    <div id="reciinfo">
      <div class="orderpay"><img src="images/20181107_231008.png" width="216" height="43" /></div>
    </div>
    
   
    <div id="reciinfo2">   
    <c:set var="m" value = "<%= man%>"/> 
      <table width="1034" height="256" border="1" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="168" height="33" align="center" bgcolor="#F8FBFC" scope="row">수령인</th>
          <td width="848">${m.name }</td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">휴대전화</th>
          <td>${m.phoneNumber}</td>
        </tr>
        <tr>
          <th height="41" align="center" bgcolor="#F8FBFC" scope="row">이메일</th>
          <td>${m.email}@${m.email2 }</td>
        </tr>
        <tr>
          <th height="35" align="center" bgcolor="#F8FBFC" scope="row">배송지 주소</th>
          <td>${m.address}</td>
        </tr>
        <tr>
          <th height="111" align="center" bgcolor="#F8FBFC" scope="row">배송 메모</th>
          <td>
            
            <textarea name="memo" id="memo" cols="45" rows="5"></textarea>
          </td>
        </tr>
      </table>
   
       <a href = "payment.jsp">
        <input name="pay" type="submit" class="btn" id="pay2" value="결제하기" /></a>
    </div> 
  </div>
 
  <div id="page_footer">
    <div id="footer1">
      <div class="footerlogo"><img src="images/이디야-footer_06.jpg" width="333" height="54" alt="footerlogo" /></div>
    </div>
    <div id="footer2">
      <div class="footermain"><img src="images/이디야-footer_13.jpg" width="956" height="133" alt="footermain" /></div>
    </div>
  </div>
  </div>
</div>
</body>
</html>
