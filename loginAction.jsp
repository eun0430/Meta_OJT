<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.Connection"%>

<%
    
	String url = "jdbc:mariadb://172.18.10.73:3306/test";
    String uid = "testuser";	
    String upw = "12345";
	
	Connection conn;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Statement stmt;
	
	try{

		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();

        String id = request.getParameter("userID");
	    String pw = request.getParameter("userPassword");

        String sql = "SELECT * FROM members WHERE mb_id = ? AND mb_pw = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		rs = pstmt.executeQuery();
		
		if(rs.next()){ 			
			response.sendRedirect("login_welcome.jsp");
			
		} else{
			response.sendRedirect("login_fail.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();

	} 
%>
</body>
