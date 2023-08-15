<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.grownjoy.dto.Event" %>
<%@ page import="com.grownjoy.db.MariaDBCon" %>
<%@ page import="com.grownjoy.db.DBC" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::관리자페이지-이벤트상세보기</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
    <style>
        img {width:10%; height:auto; margin-bottom: 20px;}
    </style>
</head>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();


    int eno = Integer.parseInt(request.getParameter("eno"));
    String sql = "select * from event where eno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, eno);
    rs = pstmt.executeQuery();

    Event event = new Event();
    SimpleDateFormat ndf = new SimpleDateFormat("yyyy년 MM월 dd일");

    if(rs.next()){
        if(rs.getDate("startdate")!=null && rs.getDate("enddate")!=null){
            event = new Event(rs.getInt("eno"), rs.getBoolean("status"), ndf.format(rs.getDate("regdate")), ndf.format(rs.getDate("startdate")), ndf.format(rs.getDate("enddate")), rs.getString("title"), rs.getString("content"), rs.getString("img_name"), rs.getString("img_path"), rs.getInt("cnt"));
        } else{
            event = new Event(rs.getInt("eno"), rs.getBoolean("status"), ndf.format(rs.getDate("regdate")), null, null, rs.getString("title"), rs.getString("content"), rs.getString("img_name"), rs.getString("img_path"), rs.getInt("cnt"));
        }
        request.setAttribute("event", event);
    }
    con.close(rs, pstmt, conn);
%>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>이벤트 관리</h2>
        <div class="table_container">
            <table class="table tb2">
                <tbody>
                <tr>
                    <th>글 제목</th>
                    <td><%=event.getTitle()%></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td><%=event.getRegdate()%></td>
                </tr>
                <tr>
                    <th>진행 여부</th>
                    <td><%=event.isStatus()%></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td><%=event.getRegdate()%></td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td><%=event.getCnt()%></td>
                </tr>
                <%
                    if(event.getStartdate()!=null && event.getEnddate()!=null){ %>
                <tr>
                    <td><%=event.getStartdate()%>~<%=event.getEnddate()%></td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="2">
                        <%if(event.getImg_name()!=null){%>
                        <img src="/event/event_img/${event.img_name}.jpg" alt="">
                        <%}%>
                        <%=event.getContent()%>
                    </td>
                </tr>
                </tbody>
            </table>
            <script>
                $(document).ready( function () {
                    $('#myTable').DataTable();
                });
            </script>
            <div class="btn_group">
                <a href="admin_event_update.jsp?eno=<%=event.getEno()%>" class="inBtn inBtn1">글 수정하기</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>