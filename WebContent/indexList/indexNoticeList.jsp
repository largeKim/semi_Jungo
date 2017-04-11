<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO" />
<%@page import="tt.notice.NoticeDTO" %>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="session"/>
<%@page import="java.util.ArrayList" %>
<%
int totalCnt = ndao.getTotalCnt();
int listSize=10;
int pageSize=5;

String sgrade_ss = (String) session.getAttribute("sgrade");
if(sgrade_ss==null){
	sgrade_ss="1";
}
String cp_s = request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}

int cp=Integer.parseInt(cp_s);

int totalPage = (totalCnt / listSize) + 1; 
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;

String username = (String)session.getAttribute("sid");
String uname = mdao.getUserInfo(username);// 작성자 이름 불러오기
System.out.println("sgrade_ss:"+sgrade_ss);

%>
<!DOCTYPE html>
<style>
.inotice_table{
	width: 360px;
	border-spacing:0px;
	border : 0;
	border-bottom: 3px double black;
	border-top: 3px double black;
	margin: 0px left;
	font-size: 14px;	
}
.inotice_thead{
	color: white;
	background-color: black;
}
.inotice_tbody{
	text-align: center;
}
.inotice_tfoot{
	border: 0;
	display: table-row-group;
}
.inotice_table a:link{ /* 링크가 걸려있는 리스트 모양 */
   color: black;
   text-decoration: none;
}

.inotice_table a:visited{ /* 링크를 누른 후 모양 */
   color: black;
   text-decoration: none;
}

.inotice_table a:hover{ /* 마우스를 가져다 댈 때 모양 */
   color: blue;
	text-decoration: underline;
}
.inotice_thead_type{
	width: 40px;
}
.inotice_thead_subject{
	width: 160px;
}
.inotice_thead_writedate{
	width: 100px;
}
.inotice_section{width:370px;}
</style>
<body>
<section class="inotice_section">
<article class="inotice_article">

	<table class ="inotice_table">
		<thead class="inotice_thead">
			<tr class="inotice_thead_tr">
				<th>&nbsp;&nbsp;</th>
				<th class="inotice_thead_type">종류</th>
				<th class="inotice_thead_subject">제목</th>
				<th>작성자</th>
				<th class="inotice_thead_writedate">일자</th>
			</tr>
		</thead>
		<tbody class="inotice_tbody">
		<%
		ArrayList<NoticeDTO> arr = ndao.noticeList(cp, listSize);
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td colspan="4" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0; i<arr.size(); i++){
				System.out.println(i);
			%>
			<tr>
				<td></td>
				<td><%=arr.get(i).getType() %></td>
				<td>
				<a href=/semi_Jungo/noticeList/noticeContent.jsp?idx=<%=arr.get(i).getIdx()%>>
				<%=arr.get(i).getSubject().length()>10?arr.get(i).getSubject().substring(0,9)+"…":arr.get(i).getSubject()%>
				</a>
				</td>
				<td><%=arr.get(i).getWriter() %></td>
				<td><%=arr.get(i).getWritedate() %></td>
			</tr>
			<%
				if(i==4)break;
			}
		}
		%>
		</tbody>

	</table>


</article>
</section>
</body>