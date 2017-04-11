<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 추가 수정 부분 170401 토 시작-->
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>

		
<%

String absPath = this.getServletContext().getRealPath("/");
String saveFolder = "adImg";
absPath = absPath + saveFolder;
System.out.println("absPath="+absPath);
wf.setUsers_home(absPath);
wf.setUser("advertise");

String path = absPath + "/" + wf.getUser() + "/";
System.out.println("path="+path);

String cp = wf.getUser();

wf.setCr_path(cp);
wf.isExists();

%>
		<!-- 추가 수정 부분 170401 토 끝-->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
strong{
	font-size: 20px;
}
#ad_main{
	margin-top: 0px;
	margin-bottom: 0px;
	text-align: center;
}
.ad_main_column{
	padding: 0px 14%;
}
p{
	font-size: 21px;
	line-height: 21px;
	font-weight: 500;
	text-align: center;
	color: #000000;
}
#ad_seprater{
    border-color: #5d91c0;
    border-top-width: 1px;
    margin-left: auto;
    margin-right: auto;
    margin-top: ;
    width: 100%;
    max-width: 30%;
}
#ad_content_span{
	position: relative;
}
</style>
</head>
    <!-- 추가 수정 부분 170401 토 시작-->
<script>
function imgUpload(){
		window.open('/semi_Jungo/upList/uploadForm_ad.jsp','upload','width=380,height=180');
}
</script>
    <!-- 추가 수정 부분 170401 토 끝-->
<body>
<%@include file="header.jsp" %>
<div id="ad_main">
	<div id="ad_main_column">
		<p>
			<strong>제휴/광고 제안하기</strong>
		</p>
	</div>
	<div id="ad_seprater"></div>
	<div id="ad_content">
	 <!-- 추가 수정 부분 170401 토 시작-->
		<form name="adcon" class="ad_content_form" action="advertise_ok.jsp">
	<!-- 추가 수정 부분 170401 토 끝-->
			<p>
			구분
			<br/>
			<span id="ad_content_span">

					<select name="atype">
						<option value="제휴">제휴</option>
						<option value="광고">광고</option>
					</select>

			</span>
			</p>
			<p>
			소속
			<br/>
			<span id="ad_content_span">
				<input type="text" name="belong" size="40" required="required">
			</span>
			</p>
			<p>
			이름
			<br/>
			<span id="ad_content_span">
				<input type="text" name="yourname" size="40" required="required">
			</span>
			</p>
			<p>
			연락처
			<br/>
			<span id="ad_content_span">
				<input type="text" name="yourtel" size="40" required="required">
			</span>
			</p>
			<p>
			이메일
			<br/>
			<span id="ad_content_span">
				<input type="text" name="yourmail" size="40" required="required">
			</span>
			</p>
			<p>
			제목
			<br/>
			<span id="ad_content_span">
				<input type="text" name="yoursub" size="40" required="required">
			</span>
			</p>
			<p>
			메세지
			<br/>
			<span id="ad_content_span">
				<textarea name="yourmsg" rows="10" cols="40" required="required"></textarea>
			</span>
			</p>
			<!-- 추가 수정 부분 170401 토 시작-->
			<p>
			광고 이미지 업로드 가로 300px 세로 450px(사이즈 규격 준수)
			<br/>
			<span id="ad_content_span">
			<input type="button" name="ad_img" value="이미지 업로드" onclick="imgUpload()">
			<input type="hidden" name="img1path" value="/semi_Jungo/<%=saveFolder%>/<%=wf.getCr_path()%>/">
			<input type="text" name="imgpath">
			</span>
			</p>
			<p>
			<span id="ad_content_span">
			도메인주소
			<br/>
			<input type="text" name="url">
			</span>
			</p>
			<!-- 추가 수정 부분 170401 토 끝-->
			<p>
				<input type="submit" value="보내기" >
			</p>
		</form>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>