<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session ="true"
    %>
    
    <%request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("password");
    String sessionId = session.getId();
    
    session.setAttribute("idKey", id);
    session.setMaxInactiveInterval(60/12);
    
    if(id != null){
    %>

    
    
    
    <%
    session.invalidate();
    } else {
    out.println("세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수 없습니다.");
    }
    %>