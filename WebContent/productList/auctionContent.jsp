<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.product.*"%>
<%@ page import="java.util.*"%>

<%@ page import="java.sql.*"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	String sid = (String) session.getAttribute("sid");
	System.out.println("sid = " + sid);

	/** 	추가 수정부분 170329 수 시작	 */
	if (sid == null) {
		sid = "";
	}
	/** 	추가 수정부분 170329 수 끝 	*/

	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) { // endsWith("")
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);

	ProductDTO dto = pdao.productContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	history.back();
</script>
<%
	return; // 자바스크립트가 실행되더라도 자바가 먼저 다 실행되므로 return을 해주어야 함.
	}
%>
<style>
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_contentTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.p_contentTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}

.p_contentTable td {
	padding-left: 5px;
}

.content_td {
	border-bottom: 1px solid black;
}

.btList {
	height: 40px;
	width: 28%;
	margin: 0px auto;
}

.content_bt {
	border: 1px solid black;
	display: block;
	float: left;
	text-align: center;
	margin: 0px 5px 0px 5px;
	padding: 8px 10px 8px 10px;
	font-size: 13px;
}

.content_bt a:LINK {
	color: black;
	text-decoration: none;
}

.content_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.content_bt a:HOVER {
	color: red;
}

.content {
	background-color: pink;
	height: 300px;
	border: 1px solid black;
	border-radius: 5px;
	margin-top: 10px;
}

.contentImg {
	width: 100%;
	background-color: skyblue;
	text-align: center;
	margin-top: 10px;
}
.auctiontable{
	display:block;
	border: double;
	width:300px;
	margin:0px;
	
	
}
.auctiontable div{
	font-size: 10px;
	width: 300px;
	background-color: ;
	padding: 5px;
	margin-left: 15px;
	
}
.auctiontable th{
	width:60px;
}
.auctiontable input[type="number"]{
	width: 80px;
}
.auctiontable input[type="text"]{
	width: 80px;	
}
#rTime{
	color:red;
	font-size: 15px;	
	width:350px;
	margin: 0px;
}
#rTime input[type="text"]{
	width:320px;
	
}

</style>

<%

Calendar today = Calendar.getInstance();



int year=0;
int month=0;
int day=0;

String endDayarr[] = dto.getWritedate().toString().split("-");
if(endDayarr!=null && endDayarr.length==3){
	
	year = Integer.parseInt(endDayarr[0]);
	month = Integer.parseInt(endDayarr[1])-1;
	day = Integer.parseInt(endDayarr[2]);
	System.out.println("endDayarr[] = "+ year +"//"+month+"//"+day);
		
}

Calendar endDay;
Calendar.Builder cb =  new Calendar.Builder();
 cb.setDate(year, month, day);
 endDay = cb.build();

System.out.println("endDay = " + endDay);
System.out.println("today = " + today);
System.out.println();
int remainDay = endDay.get(Calendar.DAY_OF_YEAR)- today.get(Calendar.DAY_OF_YEAR); 

%>
<script>

function rmt(){
var today = new Date();
var day = <%=remainDay%>
/* 초단위로 변경 */
var a = (24 - today.getHours()) * 60 * 60;  
var b = (60 - today.getMinutes()) * 60;
var c = (60 - today.getSeconds());
/* 초단위로 변경 */

var d = a + b + c;

var sec = d % 60;
d = (d-sec)/60;
var min = d % 60;
d = (d-min) / 60;
var hour = d % 60;

	if(day > 0){
		var result = day + '일 ' + hour +'시간 '+ min +'분 '+ sec + '초 남았습니다';
		document.getElementById('remainTime').value = result;
		window.setTimeout('rmt()',100);
	}else{
		document.getElementById('remainTime').value = '경매종료';
	}
}

</script>
</head>
<body onload="rmt();">
	<%@include file="../header.jsp" %>
	<section>
		<h2>
			|
			<%=dto.getIdx()%>번 경 매 |
		</h2>
		<article>
			<form name="productWrite">
				<table class="p_contentTable">
					<tr>
						<th>번호</th>
						<td style="border-right: 1px solid black;" class="content_td"><%=dto.getIdx()%></td>
						<th>종료일자</th>
						<td class="content_td"><%=dto.getWritedate()%> 23:59:59
						<div id="rTime">남은 경매시간<input type="text" id="remainTime" value="" readonly="readonly"></div>	<%-- <%=remainDay>0?remainDay:"0"%> --%>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td class="content_td" style="border-right: 1px solid black;"><%=dto.getWriter()%></td>
						<th>조회수</th>
						<td class="content_td"><%=dto.getReadnum()%></td>
					</tr>
					<tr>
						<th>상품이름</th>
						<td colspan="3" class="content_td"><%=dto.getSubject()%></td>
					</tr>
					<tr>
						<td colspan="4" align="left" valign="top">
							<!-- 추가 수정부분 170330 목 시작 -->
							<div class="contentImg">
								<%
									if (dto.getEtc1() == null || dto.getEtc1().equals("")) {
								%>
								등록된 사진이 없습니다...<br>
								<%
									} else {
								%>
								<img src="<%=dto.getEtc1()%>" id="img" width="300px"><br>
								<%
									}
								%>
							</div>
							<div class="content">
								<%=dto.getContent() == null ? "" : dto.getContent().replaceAll("\n", "<br>")%></div>
							<!-- 추가 수정부분 170330 목 끝 -->
						</td>
					</tr>
				</table>
				<div class="btList">
					<div class="content_bt">
						<!-- 	추가 수정 부분 170328 화 		시작-->
						<a
							href="product<%=dto.getType()%>List.jsp?cp=<%=request.getParameter("cp") == null ? "1" : request.getParameter("cp")%>">목록보기</a>
					</div>
					<!-- 	추가 수정 부분 170402 화 		시작 -->
					
					<!-- 	추가 수정 부분 170402 화 		끝 -->
					<%
						if (sid.equals(dto.getWriter())) {
					%>
					<div class="content_bt">
						<a
							href="proDelete.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>">삭제하기</a>
					</div>
					<div class="content_bt">
						<a
							href="auctionUpdate.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>&sort=<%=dto.getSort()%>">수정하기</a>
					</div>
					<%
						} else if (!(sid == null || sid.equals(""))) {
					%>
					<div class="content_bt">
						<a
							href="/semi_Jungo/cartList/addfavor_ok.jsp?idx=<%=dto.getIdx()%>">장바구니에넣기</a>
					</div>
					<%
						}
					%>
					<!-- 	추가 수정 부분 170328 화 		끝-->
				</div>
				<!-- 수정 추가부분 170330 목 시작  -->
				<!-- 다음글 이전글 -->
				<div align="center">
					<%
						ArrayList<ProductDTO> arr = pdao.preforList(dto.getRef(), dto);

						if (arr != null || arr.size() != 0) {

							for (int i = 0; i < arr.size(); i++) {

								if (arr.get(i).getIdx() == dto.getIdx()) {

									if (i == arr.size() - 1) {
					%>
					∧ &nbsp;이전글이 없습니다. <br>
					<%
						} else {
					%>
					<a href="auctionContent.jsp?idx=<%=arr.get(i + 1).getIdx()%>">
						∧&nbsp;이전글&nbsp; <%=arr.get(i + 1).getSubject()%>&nbsp; <%=arr.get(i + 1).getWriter()%>&nbsp;
					</a> <br>
					<%
						}

									if (i == 0) {
					%>
					∨ &nbsp;다음글이 없습니다. <br>
					<%
						} else {
					%>
					<a href="auctionContent.jsp?idx=<%=arr.get(i - 1).getIdx()%>">
						∨&nbsp;다음글&nbsp;<%=arr.get(i - 1).getSubject()%>&nbsp; <%=arr.get(i - 1).getWriter()%>&nbsp;
					</a> <br>
					<%
						}

								}
							}
						}
					%>
				</div>
		</form>
		</article>
		
	</section>
	<div class="auctiontable">	
		
				<!-- 수정 추가부분 170330 목 끝  -->
	<%
		//today.after(enDay) > 0 
		/* Calendar today = Calendar(); */
		
		int getp = dto.getPrice()+1;
		
		
		if(!(dto.getEtc2()==null || dto.getEtc2().equals("")) && dto.getEtc2().indexOf("/") != -1){	//즉시구매상품이라면
			
			String getp_s = dto.getEtc2().substring(0, dto.getEtc2().indexOf("/"));
			getp = Integer.parseInt(getp_s);
			%>
				
					
					<form action="auctionGetDeal_ok.jsp">
						<ol>
						<li>즉시구매하기</li>
						<li>
								
								<input type="number" name="dealprice" value="<%=getp%>" readonly="readonly">&nbsp;원
								<input type="hidden" name="dealid" value="<%=sid%>" required="required">
								<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
								<input type="hidden" name="etc2" value="<%=dto.getEtc2()%>">
							
							<%
							if((getp <= dto.getPrice()) || today.after(endDay)){
							%>
							
						<%
							}else{
						%>	
								<input type="submit" value="즉시구매하기">
							
						<%
							}
						%>
								
						</li>
						</ol>
					</form>
					
				
					<%
				}
				
				if((getp <= dto.getPrice()) || today.after(endDay)){
					%>
					
					<div>
							낙찰가<input type="text" name="maxprice" value="<%=dto.getPrice()%>" readonly="readonly">&nbsp;원
					</div>
				
				
					<div>이미 끝난 경매입니다.</div>
				
					<%
				}else{
				
					%>
				
						
						<ol>
							<li>최고 입찰가</li>
							<li>
								<input type="text" name="maxprice" value="<%=dto.getPrice()%>" readonly="readonly">&nbsp;원
							</li>
						</ol>
						
				
				<form action="auctionDeal_ok.jsp">
					<ol>
						<li>입찰하기</li>
						<li>		
							<input type="number" name="dealprice" step="1000" max="<%=getp==dto.getPrice()+1?"":getp %>" min="<%=dto.getPrice()+1000 %>" required="required">&nbsp;원
							<input type="hidden" name="dealid" value="<%=sid%>" required="required">
							<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
							<input type="hidden" name="etc2" value="<%=dto.getEtc2()%>">
							<input type="submit" value="입찰">
						</li>
					</ol>
				</form>	
				
				<%
				}
				%>
			
		</div>	
	<%@include file="../footer.jsp"%>
</body>
</html>
