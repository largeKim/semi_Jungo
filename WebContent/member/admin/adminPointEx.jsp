<%@ page import="oracle.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="tt.pointex.*" %>
<%@page import="tt.sendpresent.*" %>
<jsp:useBean id="pedao" class="tt.pointex.PointexDAO" scope="session"/>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="session"/>
<jsp:useBean id="sedao" class="tt.sendpresent.SendpresentDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team 2</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<style>
.peList_title{
	text-align: center;
}
.peList_table{
	width: 800px;
	border-spacing:0px;
	border : 0;
	border-bottom: 3px double black;
	border-top: 3px double black;
	margin: 0px auto;	
	margin-bottom: 30px;
}
.peList_thead{
	color: white;
	background-color: black;
}
.peList_tbody{
	text-align: center;
}
.peList_table th{
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
.peList_table td{
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
.peList_tbody_tr:hover{background-color:#f5f5f5;}

.peList_tfoot_tr:hover{background-color:#f5f5f5;}

.peList_table a:link{ /* 링크가 걸려있는 리스트 모양 */
   color: red;
   text-decoration: none;
}

.peList_table a:visited{ /* 링크를 누른 후 모양 */
   color: red;
   text-decoration: none;
}

.peList_table a:hover{ /* 마우스를 가져다 댈 때 모양 */
   color: black;
}
</style>
</head>

<%
// 로그인이 필요한 메뉴에서는 필수적으로 사용하는 코드이기때문에 따로 저장하게 되면 모듈이 된다.
String sid = (String) session.getAttribute("sid");
if (sid == null || sid.equals("")) {
%>
<script>
window.alert('로그인 후 서비스 이용이 가능합니다.');
location.href = '/semi_Jungo/exLogin/login.jsp';
</script>
<%
return;
}
int totalCnt = pedao.getTotalCnt();
int listSize=10;
int pageSize=5;

//등급확인 관리자만 페이지 접속 가능
String sgrade_ss = (String) session.getAttribute("sgrade");
if(sgrade_ss==null){
	sgrade_ss="1";
}
int sgrade = Integer.parseInt(sgrade_ss);
if(sgrade>0){
	%>
	<script>
		window.alert('관리자만 이용 가능합니다.');
		location.href='/semi_Jungo/index.jsp';
	</script>
	<%
	return;
}

//현재 페이지 설정
String cp_s = request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}

int cp=Integer.parseInt(cp_s);

//페이징 관련
int totalPage = (totalCnt / listSize) + 1; 
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;

%>
<body>
<%@include file="../../header.jsp" %>
<section>
<article class="peList_article">
	<h2 class="peList_title">포인트 상품 등록 및 삭제</h2>

	<table class ="peList_table">
		<thead class="peList_thead">
			<tr class="peList_thead_tr">
				<th>번호</th>
				<th>상품이름</th>
				<th>소요포인트</th>
				<th>재고</th>
				<th>사진</th>
				<th>코드</th>
				<th></th>
			</tr>
		</thead>
		<tbody class="peList_tbody">
		<%
		ArrayList<PointexDTO> arr = pedao.pointexList(cp, listSize);
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td colspan="6" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0; i<arr.size(); i++){
				%>
				<tr>
					<td><%=arr.get(i).getIdx() %></td>
					<td><%=arr.get(i).getPname() %></td>
                    <td><%=arr.get(i).getPprice() %></td>
                    <td><%=arr.get(i).getPnum() %></td>
                    <td><img src="<%=arr.get(i).getPicpath()%>" width="50"></td>
                    <td><%=arr.get(i).getPcode()%></td>
                    <td><a href="adminPointExUpdate.jsp?idx=<%=arr.get(i).getIdx()%>">수정</a>/<a href="adminPointExDelete.jsp?idx=<%=arr.get(i).getIdx()%>">삭제</a></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
		<tfoot class="peList_tfoot">
			<tr>
				<td colspan="6" align="center">
				<%
if(userGroup!=0){
	%>
	<a href="adminPointEx.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
	<%
}
for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
	%>
	&nbsp;<a href="adminPointEx.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
	<%
	if(i==totalPage)break;
}
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%>
	<a href="adminPointEx.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
	<%
}
%>
				</td>
				<td><a href="adminPointExAdd.jsp">추가</a></td>
			</tr>
		</tfoot>
	</table>
	<hr/>
<section>
<article class="peList_article">
	<h2 class="peList_title">포인트 주문 현황</h2>

	<table class ="peList_table">
		<thead class="peList_thead">
			<tr class="peList_thead_tr">
				<th>번호</th>
				<th>주문자</th>
				<th>받는분</th>
				<th>상품</th>
				<th>배송지</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody class="peList_tbody">
		<%
		ArrayList<SendPresentDTO> arr2 = sedao.peList(cp, listSize);
		if(arr2==null || arr2.size()==0){
			%>
			<tr>
				<td colspan="6" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0; i<arr2.size(); i++){
				%>
				<tr>
					<td><%=arr2.get(i).getRnum() %></td>
					<td><%=arr2.get(i).getUserid() %></td>
					<td><%=arr2.get(i).getId() %></td>
                    <td><a href="pointExchangeContent.jsp?idx=<%=arr2.get(i).getIdx()%>"><%=arr2.get(i).getPname() %></a></td>
                    <td><%=arr2.get(i).getRaddress() %></td>
                    <td><%=arr2.get(i).getStel()%></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
		<tfoot class="peList_tfoot">
			<tr>
				<td colspan="6" align="center">
				<%
if(userGroup!=0){
	%>
	<a href="pointExchangeList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
	<%
}
for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
	%>
	&nbsp;<a href="pointExchangeList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
	<%
	if(i==totalPage)break;
}
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%>
	<a href="pointExchangeList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
	<%
}
%>
				</td>
			</tr>
		</tfoot>
	</table>

</article>
</section>
</article>
</section>
<%@include file="../../footer.jsp" %>
</body>
</html>