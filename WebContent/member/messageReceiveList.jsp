<%@ page import="oracle.sql.ARRAY" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="tt.message.*"%>
<jsp:useBean id="medao" class="tt.message.MessageDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>== 쪽지함 ==</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">

<style>
h2{
	text-align:center;
}
.msg{
	width:600px;
	border-spacing:0px;
	border-bottom: 3px double black;
	border-top: 3px double black;
	margin: 0px auto;
}
.msg th{
	border-bottom: 3px double black;
}
a:link{ /* 링크가 걸려있는 리스트 모양 */
   color: red;
   text-decoration: none;
}

a:visited{ /* 링크를 누른 후 모양 */
   color: red;
   text-decoration: none;
}

a:hover{ /* 마우스를 가져다 댈 때 모양 */
   color: black;
}

</style>
</head>
<%
int totalCnt = medao.getTotalcnt();
int listSize=10;
int pageSize=5;
String cp_s = request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}


int cp=Integer.parseInt(cp_s);

int totalPage = (totalCnt / listSize) + 1; 
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;

String sid = (String) session.getAttribute("sid");
	if(sid==null || sid.equals("")){
		 %>
	  <script>
	  window.alert('로그인이 필요한 서비스 입니다.');
	  location.href="/semi_Jungo/login.jsp";
	  </script>
	  <%
	  return;
	}
%>
<body>
<%@include file="../header.jsp" %>
<%@include file="messageCategory.jsp" %>
<section>
<article>
	<h2>받 은 쪽 지 함</h2>
	<table class="msg">
		<thead>
			<tr>
				<th style="width:24%;">보낸사람</th>
	            <th style="width:58%;">제목</th>
	            <th style="width:18%;">보낸날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
		ArrayList<MessageDTO> arr = medao.messageReceivelist(cp, listSize,sid);
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td colspan="4" align="center">
				받은 쪽지가 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0; i<arr.size(); i++){
				%>
				<tr>
					<td><%=arr.get(i).getSender() %></td>
               		<td>
                    <a href="messageContent.jsp?idx=<%=arr.get(i).getIdx()%>">
                    <%=arr.get(i).getSubject().length()>20?arr.get(i).getSubject().substring(0,18)+"…":arr.get(i).getSubject()%></a></td>
                    <td><%=arr.get(i).getWritedate() %></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" align="center">
				<%
if(userGroup!=0){
	%>
	<a href="messageReceiveList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
	<%
}
for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
	%>
	&nbsp;<a href="messageReceiveList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
	<%
	if(i==totalPage)break;
}
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%>
	<a href="messageReceiveList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
	<%
}
%>
				</td>
			</tr>
		</tfoot>
	</table>
</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>