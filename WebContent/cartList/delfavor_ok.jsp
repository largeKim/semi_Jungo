<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>

<%
String idx_s = request.getParameter("idx");
String id = request.getParameter("id");

int idx = Integer.parseInt(idx_s);

int count = mdao.delFavorProduct(idx, id);

String msg = count>0?"관심상품 삭제성공!!":"해당 관심상품이 존재하지 않습니다.";

%>
<script>
window.alert("<%=msg%>")
location.href='favorCart.jsp';
</script>