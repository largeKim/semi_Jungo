<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tt.advertise.*"%>
<jsp:useBean id="adto" class="tt.advertise.AdvertiseDTO" scope="page"/>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO" scope="page"/>
<%
/* 추가 수정부분 170401 토 시작 */
System.out.println("getImgpath :"+adto.getImgpath());

String filename = request.getParameter("imgpath");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String imgpath = request.getParameter("img1path")+filename;
	adto.setImgpath(imgpath);
	System.out.println("글쓰기imgpath = "+imgpath);
	
}else{
	adto.setImgpath("");
}
/* 추가 수정부분 170401 토 시작 */

	int result = adao.insertAdv(adto);
	String msg = result>0?"전송되었습니다.":"전송실패\n정보확인부탁드립니다.";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/advertise.jsp';
</script>