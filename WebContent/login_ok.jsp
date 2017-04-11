<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"
scope="session"/>

<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String saveid = request.getParameter("saveid");

int result = mdao.memberLogin(userid,userpwd);// 검증
String grade = mdao.getGrade(userid);
String pwd = mdao.getPwd(userid);
int point = mdao.getPoint2(userid);
System.out.println("로그인ok_result:"+result);
System.out.println("grade:"+grade);
System.out.println("pwd:"+pwd);
System.out.println("point:"+point);
if(result==1){
	String username = mdao.getUserInfo(userid);
	session.setAttribute("sid", userid);
	session.setAttribute("sname", username);
	session.setAttribute("sgrade", grade);
	session.setAttribute("spwd", pwd);
	session.setAttribute("spoint", point);
	
	if(saveid==null||saveid.equals("")){
		Cookie ck=new Cookie("saveid",userid);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("saveid",userid);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}
	%>
	<script>
	window.alert('<%=username %>님 환영합니다!');
	location.href='/semi_Jungo/index.jsp';
	
	</script>
	<%
}else if(result==mdao.LOGIN_NO){
	%>
	<script>
	window.alert('ID 또는 비밀번호가 잘못되었습니다.');
	location.href='/semi_Jungo/login.jsp';
	</script>
	<%
}else if(result==mdao.ERROR){
	out.print("고객센터 문의바람");
}
else if(result==mdao.BLACK_YES){
	   %>
	   <script>
	      window.alert('블랙리스트 OUT');
	      location.href='login.jsp';
	   </script>
	   <%
	}
	%>