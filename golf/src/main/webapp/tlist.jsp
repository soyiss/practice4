<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section style="position:fixed; top:70px; left:0px; height:100%; width:100%; background-color:lightgray;">
<h2 style="text-align:center">강사조회</h2>

<form style="display:flex;align-items:center;justify-content:center;text-align:center">
<table border ="1">
<tr>
<td>강사코드</td>
<td>강사명</td>
<td>강의명</td>
<td>수강료</td>
<td>강사자격취득일</td>
</tr>
<%
 request.setCharacterEncoding("UTF-8");


try{
	Connection conn = Util.getConnection();
	String sql ="select * from tbl_teacher";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		int classprice=rs.getInt(4);
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###");
		String price = transformat.format(classprice);
		
		String teachdate = rs.getString(5); //20220101
		String date = teachdate.substring(0,4)+"년"+teachdate.substring(4,6)+"월"+teachdate.substring(6,8)+"일";
		
%>
		
		
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=price %></td>
		<td><%=date %></td>
		</tr>
		
		
<%
	}
	
	
	
}catch(Exception e){
	e.printStackTrace();
}



%>
</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>