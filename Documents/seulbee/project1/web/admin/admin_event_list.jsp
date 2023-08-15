<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.grownjoy.dto.Event" %>
<%@ page import="com.grownjoy.db.DBC" %>
<%@ page import="com.grownjoy.db.MariaDBCon" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::관리자페이지-이벤트관리</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
    <style>
        img {width:10%; height:auto; margin-bottom: 20px;}
        .img_tb {word-wrap: break-word}
    </style>
</head>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "select * from event";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Event> eventList = new ArrayList<>();

    SimpleDateFormat ndf = new SimpleDateFormat("yyyy년 MM월 dd일");

    while(rs.next()){
      if(rs.getDate("startdate")!=null && rs.getDate("enddate")!=null){
        eventList.add(new Event(rs.getInt("eno"), rs.getBoolean("status"), ndf.format(rs.getDate("regdate")), ndf.format(rs.getDate("startdate")), ndf.format(rs.getDate("enddate")), rs.getString("title"), rs.getString("content"), rs.getString("img_name"), rs.getString("img_path"), rs.getInt("cnt")));
      } else{
          eventList.add(new Event(rs.getInt("eno"), rs.getBoolean("status"), ndf.format(rs.getDate("regdate")), null, null, rs.getString("title"), rs.getString("content"), rs.getString("img_name"), rs.getString("img_path"), rs.getInt("cnt")));
      }
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
            <form action="admin_event_delete.jsp">
                <table class="table tb1">
                    <tbody class="img_tb">
                    <%
                        for(Event event: eventList){
                            pageContext.setAttribute("event", event);
                    %>
                    <tr>
                        <td>
                            <a href="/admin/admin_event_get.jsp?eno=<%=event.getEno()%>">
                                <ul class="img">
                                    <li>
                                        <%if(event.getImg_name()!=null){%>
                                        <img src="/event/event_img/${event.img_name}.jpg" alt="">
                                        <%} else{%>
                                        <img src="/event/event_img/0.jpg" alt="img_not_found">
                                        <%}%>
                                    </li>
                                    <li>
                                        <input type="checkbox" name="isdelete" value="<%=event.getEno()%>"> <%=event.getTitle()%>
                                    </li>
                                    <li>
                                        <%
                                            if(event.getStartdate()!=null && event.getEnddate()!=null){ %>
                                        <td><%=event.getStartdate()%>~<%=event.getEnddate()%></td>
                                        <%} else{%>
                                    </li>
                                    <li><%=event.isStatus()%></li>
                                    <%}%>
                                </ul>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable();
                    });
                </script>
                <div class="btn_group">
                    <a href="admin_event_add.jsp" class="inBtn inBtn1">이벤트 추가</a>
                    <input type="submit" class="inBtn inBtn2" value="이벤트 삭제">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>