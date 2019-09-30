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
<link href="clothesResult.css" rel="stylesheet" type="text/css" />
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
  
<div id="page_center">
     
             <%
         			
					String uploadPath = "C:\\Users\\재윤\\Documents\\web\\ws\\term\\WebContent\\term\\images";
					int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
					MultipartRequest multi = null;
					multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
				  	
					String clothesName = multi.getParameter("clothesName");
					String color = multi.getParameter("color");
					String size = multi.getParameter("size");
					int amount = Integer.parseInt(multi.getParameter("amount"));
					int price = Integer.parseInt(multi.getParameter("price"));
					String clothesType= multi.getParameter("clothesType");
					String clothesImage = multi.getOriginalFileName("clothesImage");
					String clothesImage1 = multi.getOriginalFileName("clothesImage1");
					String clothesImage2 = multi.getOriginalFileName("clothesImage2");
					String clothesImage3 = multi.getOriginalFileName("clothesImage3");
					String clothesImage4 = multi.getOriginalFileName("clothesImage4");
					String clothesImage5 = multi.getOriginalFileName("clothesImage5");
					String clothesImage6 = multi.getOriginalFileName("clothesImage6");
					String clothesImage7 = multi.getOriginalFileName("clothesImage7");
					String fullName = "/term/term/clothes/"+clothesImage;
					String fullName1 = "/term/term/images1/"+clothesImage1;
					String fullName2 = "/term/term/images1/"+clothesImage2;
					String fullName3 = "/term/term/images1/"+clothesImage3;
					String fullName4 = "/term/term/images1/"+clothesImage4;
					String fullName5 = "/term/term/images1/"+clothesImage5;
					String fullName6 = "/term/term/images1/"+clothesImage6;
					String fullName7 = "/term/term/images2/"+clothesImage7;
					
					Connection conn = ConnectionProvider.getConnection();
					Clothes clothes = new Clothes(clothesName,color,size,amount,price,clothesImage,clothesImage1,clothesImage2,clothesImage3,clothesImage4,clothesImage5,clothesImage6,clothesImage7,clothesType);
					try{ 
						ClothesDao dao = new ClothesDao();
						dao.insert(conn, clothes);
						
					}catch(SQLException e){}
					finally{JdbcUtil.close(conn);}
                %>
               <table width="800" border="1" cellspacing="0" cellpadding="3">
        <tr>
          <th width="134" height="60" scope="row">제품 이름</th>
          <td width="548"height="60"><label for="clothesName"></label>
          <%= clothesName%></td>
        </tr>
        <tr>
          <th width="134" height="60" scope="row">색상</th>
          <td width="548"height="60"><label for="color"></label>
          <%= color%></td>
        </tr>
        <tr>
          <th width="134" height="60" scope="row">사이즈</th>
          <td width="548"height="60"><label for="size"></label>
             <%= size %></td>
        </tr>
        <tr>
          <th width="134" height="60" scope="row">수량</th>
          <td width="548"height="60"><label for="amount"></label>
            <%= amount %></td>
        </tr>
        <tr>
          <th width="134" height="60" scope="row">가격</th>
          <td width="548"height="60"><label for="price"></label>
           <%= price %>원</td>
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 대표 이미지</th>
          <td width="548"height="420"><img src="<%= fullName%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지1</th>
          <td width="548"height="420"><img src="<%= fullName1%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지2</th>
          <td width="548"height="420"><img src="<%= fullName2%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지3</th>
          <td width="548"height="420"><img src="<%= fullName3%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지4</th>
          <td width="548"height="420"><img src="<%= fullName4%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지5</th>
          <td width="548"height="420"><img src="<%= fullName5%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지6</th>
          <td width="548"height="420"><img src="<%= fullName6%>"/></td><br>
                
        </tr>
        <tr>
          <th width="134" height="420" scope="row">제품 상세 이미지7</th>
          <td width="548"height="420"><img src="<%= fullName7%>"/></td><br>
                
        </tr>
        <tr>
			</tr>
                </table></br></br>
                
                제품 등록이 완료되었습니다.<br><br><br></br>
                                     
                <a href = "clothesdetail.jsp?clothesId=${clothes.clothesId}">☞등록된 제품 확인하기</a>
</div>

</body>
</html>
