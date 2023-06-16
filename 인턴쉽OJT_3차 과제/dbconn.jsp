<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head>
    <title>DB_Conn</title>
</head>

<body>
 
<%
    String url = "jdbc:mariadb://172.18.10.73:3306/test";
    String uid = "testuser";		// 접속을 위한 계정의 ID
    String upw = "12345";	// 접속을 위한 계정의 암호

    Connection conn;
    Statement stmt;

    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, uid, upw);
    out.println("<h1>MariaDB DB 연결 성공</h1>");
%>
 
</body>
 
</html>
