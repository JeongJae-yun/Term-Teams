<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "my.model.*,my.dao.*,java.sql.*,my.util.*,java.util.*" %>  
    <%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="clothesInfo1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body,td,th {
	color: #000;
	font-family: "a옛날사진관2";
	text-align: left;
}
</style>
</head>

<body>
<p>&nbsp;</p>
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
   <%
  
  int clothesId = Integer.parseInt(request.getParameter("clothesId"));
	Connection conn = ConnectionProvider.getConnection();
	Clothes clothes = null;
	try{
		ClothesDao dao = new ClothesDao();
		dao.updateAccessCount(conn, clothesId);
		clothes = dao.selectById(conn, clothesId);
		
	}catch(SQLException e){}
	finally{JdbcUtil.close(conn);}
	
  %>
	<c:set var="clothes" value="<%=clothes%>"/>
    <div class="product"><img src="/term/term/images2/${clothes.clothesImage7}"/></div>
    <div class="product_title">
      <form id="form1" name="form1" method="post" action="">
        <table width="700" border="0" cellpadding="0" cellspacing="0" id="registerform">
          <tr>
            <th width="149"><label for="idfield3">제품명 </label></th>
            <td width="551"><label for="clothesName"></label>
            <input name="clothesName" type="text" id="clothesName"  value="${clothes.clothesName }"/></td>
          </tr>
          <tr>
            <th><label for="pwfield">색상</label></th>
            <td><label for="color"></label>
              <select name="color" id="color">
                <option value="[필수]옵션을 선택해 주세요." selected="selected">[필수]옵션을 선택해 주세요.</option>
                <option value="${clothes.color }"> ${clothes.color} </option>
               
            </select></td>
          </tr>
          <tr>
            <th><label for="emailfield">사이즈</label></th>
            <td><label for="size"></label>
              <select name="size" id="size">
                <option value="[필수]옵션을 선택해 주세요." selected="selected">[필수]옵션을 선택해 주세요.</option>
                <option value="XL">XL</option>
                <option value="L">L</option>
                <option value="M">M</option>
                <option value="S">S</option>
            </select></td>
          </tr>
          <tr>
            <th> 수량</th>
            <td><select name="amount" id="amount">
              <option value="[필수]옵션을 선택해 주세요.">[필수]옵션을 선택해 주세요.</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
            </select></td>
          </tr>
          <tr>
            <th>가격</th>
            <td><label for="price"></label>
            <input name="price" type="text" id="price"  value="${clothes.price}"/></td>
          </tr>
          <tr>
            <th colspan="2">※최소주문수량 1개 이상</th>
          </tr>
          <tr>
            <th colspan="2"><strong>※무통장입금시 입금자와 금액이 다를 경우 자동확인이 안되오니 주의바랍니다.</strong></th>
          </tr>
          <input type ="hidden"  id="clothesId"  value="${clothes.clothesId}">
        </table>
        <div class="buy_cart">
          <table width="700" border="1" cellspacing="0" cellpadding="3">
            <tr>
          	  <c:if test = "${id == null}">
				<td width="340"><a href="customerlogin.jsp"><input type="button" class="btn"  value="로그인 "></a></td>
              	<td width="340"><a href="customerjoin.jsp"><input type="button" class="btn" value="회원가입"></a></td>
				</c:if>  
	   
				<c:if test = "${id != null}">
				<td width="340"><input type="button" class="btn" onclick="buy()" value="구매"></td>
              	<td width="342"><input type="button" class="btn" onclick="cart()" value="카트담기"></td>	
				</c:if>
              
            </tr>
          </table>

<script type="text/javascript">
	function buy(){
		var clothesId = document.getElementById("clothesId").value.trim();
		var amount = document.getElementById("amount").value.trim();
		var price = document.getElementById("price").value.trim();
		location.href = 'pay.jsp?clothesId='+clothesId+'&amount='+amount+'&price='+price;
	}
	function cart(){
		var clothesId = document.getElementById("clothesId").value.trim();
		var amount = document.getElementById("amount").value.trim();
		var price = document.getElementById("price").value.trim();
		location.href = 'cartResult2.jsp?clothesId='+clothesId+'&amount='+amount+'&price='+price;
	}

</script>
        </div>
        <div class="evnet_banner">
          <p> ★신규 회원가입 혜택</p>
          <p>신규회원 가입시 배송비 무료</p>
          <p>(※첫 주문 1회시에만 사용가능)</p>
          <p>★텀앤팀스 클로스 특별혜택</p>
          <p>SNS(페이스북,인스타그램)게릴라</p>
          <p>&nbsp;</p>
        </div>
        <p>&nbsp;</p>
      </form>
    </div>
    <div class="page_banner">
      <div class="ban1"><a href="#info1">상품 상세 정보</a></div>
      <div class="ban2"><a href="#info2">사이즈 정보
      </a></div>
      <div class="ban3"><span class="ban4"><a href="#info3">교환 환불 정보</a></span></div>
      <div class="ban4"><a href="community.jsp">구매후기</a></div>
    </div>
    <div id="page_info">
      <p><a name="info1" id="info1"></a>상품상세정보</p>
      <div id="product_info_image">
       <div class="p_i_image1"><img src="/term/term/images1/${clothes.clothesImage1}"/></div>
        <div class="p_i_image2"><img src="/term/term/images1/${clothes.clothesImage2}"/></div>
        <div class="p_i_image3"><img src="/term/term/images1/${clothes.clothesImage3}"/></div>
        <div class="p_i_image4"><img src="/term/term/images1/${clothes.clothesImage4}"/></div>
        <div class="p_i_image5"><img src="/term/term/images1/${clothes.clothesImage5}"/></div>
        <div class="p_i_image6"><img src="/term/term/images1/${clothes.clothesImage6}"/></div>
        <div id="product_size">
          <p>SIZE<a name="info2" id="info2"></a></p>
          <p>&nbsp;</p>
          <p>상의</p>
          <table width="748" border="1" cellspacing="0" cellpadding="3">
            <tr>
              <th width="131" scope="col">cm</th>
              <th width="131" scope="col">총장</th>
              <th width="131" scope="col">어깨너비</th>
              <th width="131" scope="col">가슴단면</th>
              <th width="182" scope="col">소매길이</th>
            </tr>
            <tr>
              <td>my</td>
              <td colspan="4">본인이 가지고 계신 제품과 비교해 보세요.</td>
            </tr>
            <tr>
              <td>XL</td>
              <td>74</td>
              <td>59</td>
              <td>72</td>
              <td>66</td>
            </tr>
            <tr>
              <td>L</td>
              <td>71</td>
              <td>57</td>
              <td>68</td>
              <td>63</td>
            </tr>
            <tr>
              <td>M</td>
              <td>68</td>
              <td>55</td>
              <td>64</td>
              <td>60</td>
            </tr>
            <tr>
              <td>S</td>
              <td>65</td>
              <td>53</td>
              <td>60</td>
              <td>57</td>
            </tr>
            
          </table>
            <p>&nbsp;</p>
            <p>하의</p>
            <table width="938" border="1" cellspacing="0" cellpadding="3">
            <tr>
              <th width="131" scope="col">&nbsp;</th>
              <th width="131" scope="col">총장</th>
              <th width="131" scope="col">허리</th>
              <th width="131" scope="col">허벅지</th>
              <th width="182" scope="col">밑위</th>
              <th width="182" scope="col">밑단</th>
            </tr>
            <tr>
              <td>my</td>
              <td colspan="5">본인이 가지고 계신 제품과 비교해 보세요.</td>
            </tr>
            <tr>
              <td>L</td>
              <td>102</td>
              <td>37</td>
              <td>-</td>
              <td>36</td>
              <td>16</td>
            </tr>
            <tr>
              <td>M</td>
              <td>100</td>
              <td>33</td>
              <td>-</td>
              <td>35</td>
              <td>15</td>
            </tr>
            <tr>
              <td>S</td>
              <td>98</td>
              <td>30</td>
              <td>-</td>
              <td>34</td>
              <td>14</td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
        
        <div id="notice">
          <h1>NOTICE</h1>
          <p>세탁시 주의 사항</p>
          <p>-세탁시에 형태가 변형될 우려가 있으니 반드시 드라이 클리닝 해주시기 바랍니다.</p>
          <p>-건조시에는 바람이 잘 드는 곳에서 형태를 잡아 세탁을 해주시기 바랍니다.</p>
          <p>-세탁 후에는 환불, 교환이 어려우니, 반드시 세탁법을 확인 후 실행 해 주시기 바랍니다.</p>
          <p>&nbsp;</p>
          <p>구매전 확인사항</p>
          <p>-모니터의 밝기와 명암에 따라 상품의 컬러가 다르게 보일 수 있으니, 반드시 맞춰서 컬러호 확인을 해주시길 바랍니다.</p>
          <p>-제품의 컬러는 화보 컷의 경우 보정이 되었으므로, 상세 컷을 참고해 주시기 바랍니다.</p>
          <p>-제품에 묻은 초크의 경우 공정 중에서 발생하는 부분으로, 다림질 혹은 세탁 후에 자연스럽게 승화되므로 참고 부탁드립니다.</p>
          <p>-워싱 된 제품이나 전체적으로 프린트 무늬가 들어간 원단의 경우, 워싱 위치나 문양, 무늬 등이 약간씩 다를 수 있습니다.</p>
          <p>-실측 사이즈는 공정을 하며, 1-2cm 정도의 차이가 있을 수 있습니다. </p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <div id="exchange">
            <table width="1300" height="219" border="1" cellpadding="3" cellspacing="0">
              <tr>
                <td colspan="2"><h1>INFORMATION CENTER<a name="info3" id="info3"></a></h1></td>
              </tr>
              <tr>
                <td width="182"> 배송안내</td>
                <td width="670"><p>-오후 2시 이전 주문건에 한하여 당일 출고되고 있습니다.</p>
                  <p>-제주도 및 도서산간 지역 운임비는 추가되고 있습니다.</p>
                <p>-결제 완료일 기준으로 2~7일 정도 배송기간이 소요됩니다.(토,일,공휴일 제외)</p>
                <p>(제주 및 도서지역, 품절된 상품, 입고지연, 제작 상품의 경우 배송이 더 지연될 수 있습니다.)</p></td>
              </tr>
              <tr>
                <td>교환 반품 안내</td>
                <td><p>-교환 및 반품은 상품 수령일로부터 7일 이내에 가능합니다.</p>
                <p>-교환 및 반품 전 반드시 게시판 또는 고객센터로 먼저 접수해주셔야 하비다.</p>
                <p>-교환 및 반품은 우체국택배를 통해 보내주세요.</p>
                <p>-우체국택배를 이용해주셔야 하며, 타 태개 이용시 매송 요금은 선불로 고객님께서 부담해주셔야 합니다.</p>
                <p>-단순 변심에 의한 교환이나 반품은 고객님께서 왕복 택배요금을 부담해주셔야 합니다.</p>
                <p>-배송시 생길 수 있는 상품의 구김이나 생산 시 생길 수 있는 마감 처리 미흡 부분, 워싱으로 인한 옷 틀어짐 등은 불량 사유가 될 수 없습니다.</p>
                <p>-받아보신 상품에 문제가 있다 하더라도 원주문 상품이 아닌 다른 상품으로의 교환은 변심으로 간주되며, 편도 배송료는 고객님께서 부담하셔야 합니다.</p></td>
              </tr>
              <tr>
                <td>환불처리 안내</td>
                <td><p>-상품 도착 후 환불 처리는 1~3일 이내에 처리됩니다.</p>
                <p>-무통장/실시간 이체의 경우 고객님의 은행 계좌를 알려주시면 이체됩니다.</p>
                <p>-적립금으로 구입하신 상품은 적립금으로 환불됩니다.</p>
                <p>-신용카드로 결제하신 경우는 신용카드 승인 취소를 요청한 날로부터 7~15일 이내에 취소가 됩니다.</p>
                <p>-실시간 계좌이체는 2~5일 후 해당은행에서 환불 처리됩니다.</p></td>
              </tr>
              <tr>
                <td>반품불가 안내</td>
                <td><p>-반품 기일이 지난 상품( 상품 수령일로부터 7일)</p>
                <p>-상품의 가치가 훼손된 경우(세탁, 향수냄세, 얼룩, 착용흔적)</p>
                <p>-인위적인 상품 손상의 경우(택, 바코드를 제거, 수선)</p>
                <p>-세일상품, 수제화 제품</p>
                <p>-전화나 환불/교환 미접수 후 상품을 보내실 경우 반송처리될 수 있으니 반드시 환불/교환 신청해주세요.</p></td>
              </tr>
            </table>
          </div>
        </div>
        <div class="p_i_notice"></div>
        <div class="p_i_exchange"></div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
