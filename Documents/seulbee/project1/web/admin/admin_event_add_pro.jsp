<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.grownjoy.db.DBC" %>
<%@ page import="com.grownjoy.db.MariaDBCon" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    SimpleDateFormat ndf = new SimpleDateFormat("yyyy-MM-dd");


    String title = request.getParameter("title");
    String str_startdate = request.getParameter("startdate");
    boolean status = Boolean.parseBoolean(request.getParameter("staus"));
    Date startdate = null;
    if(!str_startdate.equals("")) {
        java.util.Date utilDate  =  ndf.parse(str_startdate);
         startdate = new java.sql.Date(utilDate.getTime());
    }
    String str_enddate = request.getParameter("enddate");
    Date enddate = null;
    if(!str_enddate.equals("")) {
        java.util.Date utilDate  =  ndf.parse(str_enddate);
        startdate = new java.sql.Date(utilDate.getTime());
    }
    String content = request.getParameter("content");

    String sql = "insert into gnj.event(title, startdate, enddate, content, status) values (?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, title);
    pstmt.setDate(2, startdate);
    pstmt.setDate(3, enddate);
    pstmt.setString(4, content);
    pstmt.setBoolean(5, status);
    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        System.out.println("정상적으로 수정되었습니다.");
        response.sendRedirect("/event/admin_event_list.jsp");
    } else{
        System.out.println("수정이 완료되지 않았습니다.");
    }

    con.close(rs, pstmt, conn);

%>
<body>
</body>
</html>