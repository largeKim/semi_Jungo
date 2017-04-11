<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.sport.*"%>
<%@ page import="tt.sport.comment.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session" />
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="page" />
<jsp:useBean id="scdao" class="tt.sport.comment.Sport_CommentDAO" />
<jsp:useBean id="srdao" class="tt.sport.recom.RecomDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	//접속자 id받아오기
	String sid = (String) session.getAttribute("sid");

	//게시물이 있던 페이지 받아오기
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "0";
	}
	int cp = Integer.parseInt(cp_s);

	//게시물 idx 받아오기
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) {
%>
<script>
		window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
		history.back();
	</script>
<%
	return;
	}
	int idx = Integer.parseInt(idx_s);

	//내용물받아오기
	SportDTO dto = sdao.sportContent(idx);

	if (dto == null) {
%>
<script>
		window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
		history.back();
	</script>
<%
	return;
	}

	//reply 값 받아오기(대댓글)
	String reply = request.getParameter("reply");
	if (reply == null || reply.equals("")) {
		reply = "off";
	}
	//repidx값 받아오기
	String repidx_s = request.getParameter("repidx");
	if (repidx_s == null || repidx_s.equals("")) {
		repidx_s = "0";
	}
	int repidx = Integer.parseInt(repidx_s);
%>
<script>
function addComm(){
	var repcont = document.sportContent.comment.value;
	var url1 = 'sportComment.jsp?writer=<%=sid%>&sportidx=<%=dto.getIdx()%>&cp=<%=cp%>&repcont=';
	var r_url = url1.concat(repcont);
	location.href=r_url;
}

function recom(){
	location.href='sportRecom_ok.jsp?idx=<%=dto.getIdx()%>&id=<%=sid%>&cp=<%=cp%>',
				'recom', 'width=380,height=180';
	}
</script>
<style>
.s_ContentTable {
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
}

.s_ContentTable_top {
	border-bottom: 3px double black;
}

.s_ContentTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}

.s_ContentTable_tdcol {
	border-bottom: 1px solid black;
}

.s_ContentTable_tdcol2 {
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}

.s_ContentBtn {
	background-color: white;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
}

.s_ContentContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
	margin-top: 10px;
}

.content {
	height: 300px;
	border: 1px solid black;
	border-radius: 5px;
	margin-top: 10px;
	padding: 5px;
}

.contentImg {
	width: 100%;
	text-align: center;
	margin-top: 10px;
}

.com_Table {
	margin: 0px auto;
	border-top: 1px dotted black;
	margin-top: 10px;
	width: 750px;
}

.comment_bt {
	display: block;
	text-align: center;
	border: 1px solid black;
	font-size: 13px;
}

.comment_bt a:LINK {
	color: black;
	text-decoration: none;
}

.comment_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.comment_bt a:HOVER {
	color: red;
}

.s_content_bt {
	display: block;
	float: left;
	border: 1px solid black;
	padding: 5px 10px 5px 10px;
	font-size: 13px;
	margin: 0px 5px 0px 5px;
}

.s_content_bt a:LINK {
	color: black;
	text-decoration: none;
}

.s_content_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.s_content_bt a:HOVER {
	color: red;
	text-decoration: none;
}
.s_btList{
	width: 335px;
	height: 40px;
	margin: 0px auto;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<form name="sportContent">
				<table class="s_ContentTable">
					<tr>
						<td class="s_ContentTable_top" colspan="4" align="center"><h3><%=dto.getSort()%>게시판
							</h3></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td class="s_ContentTable_tdcol2"><%=dto.getWriter()%></td>
						<th>조회수</th>
						<td class="s_ContentTable_tdcol"><%=dto.getReadnum()%></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td class="s_ContentTable_tdcol2"><%=dto.getWritedate()%></td>
						<th>추천수</th>
						<td class="s_ContentTable_tdcol"><%=dto.getRecom()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" class="s_ContentTable_tdcol"><%=dto.getSubject()%></td>
					</tr>
					<tr height="350">
						<td colspan="4" align="left" valign="top">
							<div class="contentImg">
								<%
									if (dto.getPicpath() == null || dto.getPicpath().equals("")) {
								%>
								등록된 사진이 없습니다
								<%
									} else {
								%>
								<img src="<%=dto.getPicpath()%>" id="img"><br>
								<%
									}
								%>
							</div>
							<div class="content">
								<%=dto.getContent().replaceAll("\n", "<br>")%>
							</div>
						</td>
					</tr>
					<%
						String idcode = sid + dto.getIdx();
						if (sid == null || sid.equals("")) {

						} else if (!srdao.chkRecom(idcode)) {
					%>
					<tr>
						<td colspan="4" align="center">이미 추천하신 글입니다.</td>
						<!-- 추천버튼 -->
					</tr>
					<%
						} else {
					%>
					<tr>
						<td colspan="4" align="center"><input type="button"
							class="s_ContentBtn" value="추천" onclick="recom()"></td>
						<!-- 추천버튼 -->
					</tr>
					<%
						}

						//댓글리스트 관련
						int totalCnt = scdao.getTotalCnt(dto.getIdx());// 총 댓글 수
						int listSize = 20; // 보여줄 댓글 수
						int pageSize = 5; // 한번에 몇개씩 보여줄 댓글 페이지 수

						String cmcp_s = request.getParameter("cmcp");
						if (cmcp_s == null || cmcp_s.equals("")) {
							cmcp_s = "1";
						}

						int cmcp = Integer.parseInt(cmcp_s); // 현재 페이지
						int totalPage = totalCnt / listSize + 1; // 총 페이지 수
						if (totalCnt % listSize == 0)
							--totalPage;

						int userGroup = cmcp / pageSize;//유저가 속해있는 그룹
						if (cp % pageSize == 0)
							--userGroup;

						if (sid == null) {

						} else {
					%>
					<tr>
						<td align="right"><%=sid%> |</td>
						<td colspan="2" style="padding-left: 10px;"><input
							type="text" name="comment" placeholder="내용을 입력해주세요." size="70px;"></td>
						<td><input type="button" class="s_ContentBtn" value="댓글 작성"
							onclick="addComm()"></td>
					</tr>
					<%
						}
						ArrayList<Sport_CommentDTO> scarr = scdao.scList(idx);
						if (scarr == null || scarr.size() == 0) {
					%>
					<tr>
						<td colspan="4" align="center">댓글이 없습니다. 댓글을 남겨주세요~</td>
					</tr>
					<%
						} else {
					%>

					<tr>
						<td colspan="4">
							<table class="com_Table">
								<%
									for (int i = 0; i < scarr.size(); i++) {
								%>
								<tr>
									<td align="right"><%=scarr.get(i).getWriter()%> |</td>
									<td width="550px;" style="padding-left: 10px;"><%=scarr.get(i).getRepcont()%></td>
									<td style="font-size: 10px; color: gray;"><%=scarr.get(i).getWritedate()%></td>
									<%
										if (sid != null && sid.equals(scarr.get(i).getWriter())) {
									%>
									<td>
										<div class="comment_bt">
											<a
												href="delComm.jsp?idx=<%=scarr.get(i).getIdx()%>&sportidx=<%=scarr.get(i).getSportidx()%>&cp=<%=cp%>">삭제</a>
										</div>
									</td>

									<%
										}
									%>
								</tr>
								<%
									}
								%>
							</table>
						</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="4" align="center">
							<div class="s_btList">
								<%
									/* 작성자일 경우 */
									if (!(sid == null) && sid.equals(dto.getWriter())) {
								%>
								<div class="s_content_bt">
									<a href="<%=dto.getSort()%>List.jsp?cp=<%=cp%>">목록보기</a>
								</div>
								<div class="s_content_bt">
									<!-- 답변버튼 -->
									<a
										href="sportReWrite.jsp?idx=<%=dto.getIdx()%>&sort=<%=dto.getSort()%>&subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a>
								</div>
								<div class="s_content_bt">
									<a
										href="sportDelete.jsp?idx=<%=dto.getIdx()%>&sort=<%=dto.getSort()%>">삭제하기</a>
								</div>
								<div class="s_content_bt">
									<a
										href="sportUpdate.jsp?idx=<%=dto.getIdx()%>&sort=<%=dto.getSort()%>">수정하기</a>
								</div>
								<%
									} else {/* 작성자가 아닌 경우 */
								%>
								<div class="s_content_bt">
									<a href="<%=dto.getSort()%>List.jsp?cp=<%=cp%>">목록보기</a>
								</div>
								<div class="s_content_bt">
									<a
										href="sportReWrite.jsp?idx=<%=dto.getIdx()%>&sort=<%=dto.getSort()%>&subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a>
								</div>
								<%
									}
								%>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>