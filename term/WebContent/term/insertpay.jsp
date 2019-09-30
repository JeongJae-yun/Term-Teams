<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
				request.setCharacterEncoding("utf-8");
				ArrayList <Integer> list = new ArrayList(10);
				int plength = Integer.parseInt(request.getParameter("price_length"));
				
            	for ( int i = 0 ; i < plength ; i++)
            	{
            		String name = "allprice"+i;
            		list.add(Integer.parseInt(request.getParameter(name)));
            	}
      			//int allprice2 = list;
     			String id = (String)session.getAttribute("UI");
     			String name = request.getParameter("name");
     		    int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
     		    String address = request.getParameter("address");
     		    String memo = request.getParameter("memo");
				String cardId = request.getParameter("cardId");
				String cardCompany = request.getParameter("cardCompany");
				String halbu =request.getParameter("halbu");
				String soldout	= request.getParameter("soldout");
             	Connection conn = ConnectionProvider.getConnection();
             	           	
             	try{
             		PocketDao pdao = new PocketDao();
             		for( int i = 0 ; i <list.size() ; i++ )
             		{
             			Pocket pocket = new Pocket(id,list.get(i),cardId,cardCompany,halbu,soldout,new java.util.Date(),name,phoneNumber,address,memo);               		 	
              			pdao.insert(conn, pocket);		
             		}
             		
             	}
             	catch(SQLException e){} 
             	finally{ JdbcUtil.close(conn);
             	
             	}
%>


<script >
alert("결제가 완료되었습니다.이용해주셔서 감사합니다.");

location.href="mypage.jsp?refresh="+<%=System.currentTimeMillis()%>; 
            	
</script>
 <div id="footer">
        <div id="footer_info">
          <p>경기도 시흥시 산기대학로 237 한국산업기술대학교 | TEL: 031-123-4567 | FAX: 031-123-4567</p>
          <p>사업자등록번호:123-45-6789 | 통신판매업 신고: 시흥 제 123456호 </p>
          <p>&copy;2018 Term &amp; Teams Clothes COMPANY. ALL RIGHTS RESERVED</p>
        </div>
      </div>
</body>
</html>