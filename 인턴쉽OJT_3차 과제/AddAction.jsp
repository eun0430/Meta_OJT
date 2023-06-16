<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.Connection"%>

<%
   
	String url = "jdbc:mariadb://172.18.10.73:3306/test";
    String uid = "testuser";	
    String upw = "12345";
	
	Connection conn;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Statement stmt;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, uid, upw);
        stmt = conn.createStatement();

        // 입력된 사용자 정보 가져오기
        String inputUserID = request.getParameter("newID");
        String inputPassword = request.getParameter("newPassword");
        String inputEmail = request.getParameter("newEmail");

        // 사용자 정보 삽입 쿼리 실행
        String query = "INSERT INTO members(mb_id, mb_pw, mb_email) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, inputUserID);
        pstmt.setString(2, inputPassword);
        pstmt.setString(3, inputEmail);

        pstmt.executeUpdate();

        // 회원가입 성공 시 로그인 페이지로 이동
        response.sendRedirect("CreateSuccess.jsp");
        rs.close();
        pstmt.close();
        conn.close();

    } catch (Exception e) {
        out.println(e);
    }
%>