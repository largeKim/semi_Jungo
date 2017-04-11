<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mdto" class="tt.member.MemberDTO" />
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />


<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr_1") + "|" + request.getParameter("addr_2");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-"
			+ request.getParameter("tel3");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	
	String msg = "";
	int result = 0;
	if ("".equals(id) || id.length() == 0) {
		msg = "아이디를 입력하세요";
	}else if ("".equals(email2) || email2.length()==0){
		//result=0;
		msg = "이메일을 확인하세요";
	}else if( "".equals(tel1) || tel1.length()==0){
		//result=0;
		msg = "전화번호를 확인하세요";
	}
	else {
		mdto.setId(id);
		mdto.setPwd(pwd);
		mdto.setName(name);
		mdto.setAddr(addr);
		mdto.setEmail(email);
		mdto.setTel(tel);

	 result = mdao.memberJoin(mdto);
		System.out.println("id=" + id);
		System.out.println("pwd=" + pwd);
		System.out.println("addr=" + addr);
		System.out.println("email=" + email);
		System.out.println("tel=" + tel);
		
		msg = "회원가입을 축하합니다";
	}
%>
<script>
window.alert('<%=msg%>');
location.href = <%=result%> > 0?"../index.jsp" : "join.jsp";
</script>