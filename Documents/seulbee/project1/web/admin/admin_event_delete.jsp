<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
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

    String[] isdelete = request.getParameterValues("isdelete");


    for(String s: isdelete){
        String sql = "delete from gnj.event where eno=?";
        pstmt = conn.prepareStatement(sql);
        int eno = Integer.parseInt(s);
        pstmt.setInt(1, eno);
        int cnt = pstmt.executeUpdate();
        if(cnt>0) {
            System.out.println(eno+"가 정상적으로 삭제됨");
        }
        else{
            System.out.println("삭제 안 됨");
        }
    }

    response.sendRedirect("/event/admin_event_list.jsp");

    con.close(rs, pstmt, conn);

%>