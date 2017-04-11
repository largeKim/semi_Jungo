<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>
<%
String idx_s = request.getParameter("idx");

/* String id = request.getParameter("id"); */
String id = (String)session.getAttribute("sid");




if(id == null || id.equals("")){ 
	  %>
	  <script>
	  window.alert('로그인이 필요한 서비스 입니다.');
	  location.href="/semi_Jungo/exLogin/login.jsp";
	  </script>
	  <%
	  return;
} 


int idx = Integer.parseInt(idx_s);
System.out.println("id = "+id);
System.out.println("idx = "+idx);
int count = mdao.addFavorProduct(idx, id);

if(count>0){
%>
<script>
	var result = window.confirm('장바구니에 추가되었습니다 장바구니를 확인하시겠습니까?');
	
	if(result){
		location.href='favorCart.jsp';	
	}else{
		history.back();
	}

</script>
<%
}else if(count==-2){
	%>
	<script>
	window.alert('이미 장바구니에 있는 상품입니다.');
	history.back();
	</script>
	<%
}else{
	%>
	<script>
	history.back();
	</script>
	<%
}
%>

<%-- <script>
window.alert("<%=msg%>")
location.href='tt_test.jsp';
</script> --%>