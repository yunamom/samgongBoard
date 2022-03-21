<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

String m_name = request.getParameter("m_name");

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
	  conn = DAO.getConnection();
	  String sql = " SELECT m_no ";
	         sql+= " FROM movie ";
	         sql+= " WHERE m_name LIKE '%"+m_name+"%' ";
	      	 /* select 문 결과를 합쳐줍니다. */
	         sql+= " UNION ALL "; 
	         sql+= " SELECT count(*) ";
	         sql+= " FROM movie ";
	         sql+= " WHERE m_name LIKE '%"+m_name+"%' ";
	       
	  ps = conn.prepareStatement(sql);
	  rs = ps.executeQuery();
	  int m_no = 0;  

	  ArrayList<String> list = new ArrayList<String>();
	  
	  while(rs.next()){
		m_no = Integer.parseInt(rs.getString("m_no"));
		/* 영화 검색 결과를 어레이 리스트에 담은뒤 */
		list.add(m_no+"");
	  }
	  
	  /* 검색결과가 있을경우 session에 검색결과 리스트를 담아준뒤, 영화목록으로 이동합니다.*/
	  if(m_no > 0){
		  /* 세션값으로 보내줍니다. */
		  session.setAttribute("session_movie_no",list);
		  %>
		  <script>
		  location = "movieList.jsp?search=1";	  
		  </script>		  
		  <%
	  }
	  
	  /* 검색결과가 없을경우 메인화면으로 돌아갑니다. */
	  else{
		  %>
		  <script>
		  location = "index.jsp";	  
		  </script>
		  <%
	  }
}catch(Exception e) {
	e.printStackTrace(); 
}
%>