<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<section>
	<article>
	<h3>알려드립니다.</h3>
	</article>
	<article>
		<ul>
			<li><label>1. 요새 사기신고가 들어오는게 많습니다. 상대방의 정보를 확인해주세요</label></li>
			<li><label>2. 타인을 비하하거나 욕설을 자제해주시기 바랍니다</label></li>
			<br>
			<li><label>[포인트상점]에 새 상품이 입고되었습니다. </label></li>
		</ul>
	</article>
	<article>
		<form action="popup_ok.jsp">
			<p style="margin: 0px;padding: 0px;">
			<input type="checkbox" name="ckbox" value="close1">오늘 하루 다시 열지 않기
			<input type="submit" name="close" value="닫기">
			</p>
		</form>
	</article>
</section>
</body>
</html>