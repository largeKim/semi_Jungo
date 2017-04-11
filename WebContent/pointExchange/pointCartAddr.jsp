<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="tt.member.*"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<!DOCTYPE html>
<%
   int price = Integer.parseInt(request.getParameter("price"));
   int pnum = Integer.parseInt(request.getParameter("pnum"));
   int total = price * pnum;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h4 {
   text-align: center;
}

.chkbx {
   text-align: center;
}

.shoppingCartInfo {
   margin: 0px auto;
   border-spacing: 10px;
   border-top: 3px double black;
   border-bottom: 3px double black;
   width: 600px;
   margin-top: -10px;
   margin-bottom: 20px;
   width: 600px;
}

.shoppingCartInfo td {
   border-left: 2px solid black;
   padding: 0px 0px 5px 15px;
}

.shoppingCartInfo th {
   text-align: right;
   padding-right: 10px;
   font-size: 13px;
}

.addrText {
   font-size: 10px;
}

.shopCart_okbt {
   border: 1px solid black;
   background-color: white;
   margin: 0px auto;
   padding: 5px 10px 5px 10px;
}

.shopCart_divbt {
   width: 100px;
   text-align: center;
   margin: 0px auto;
}
</style>
<%
   String sid_po = (String) session.getAttribute("sid");
   int point = Integer.parseInt(request.getParameter("point"));
   if (total > point) {
%>
<script>
   window.alert('포인트가 부족합니다.');
   history.back();
   </script>
<%
   return;
   }
   String uiLoad = request.getParameter("ui");
   if(uiLoad==null){
      uiLoad="";
   }
%>
<script>
function userInfoLoad(){
   
   var pname_1 = '&pname=';
   var pname_2 = document.shopCartInfo.pname.value;
   var pname = pname_1.concat(pname_2);
   
   var price_1 = '&price=';
   var price_2 = document.shopCartInfo.price.value;
   var price = price_1.concat(price_2);
   
   var path_1 = '&path=';
   var path_2 = document.shopCartInfo.path.value;
   var path = path_1.concat(path_2);
   
   var pnum_1 = '&pnum=';
   var pnum_2 = document.shopCartInfo.pnum.value;
   var pnum = pnum_1.concat(pnum_2);
   
   var pcode_1 = '&pcode=';
   var pcode_2 = document.shopCartInfo.pcode.value;
   var pcode = pcode_1.concat(pcode_2);
   
   var point_1 = '&point=';
   var point_2 = document.shopCartInfo.point.value;
   var point = point_1.concat(point_2);
   
   var url_1 = 'pointCart.jsp?ui=<%=sid_po%>&userclick=1';
   var url_2 = pname.concat(price.concat(path.concat(pnum.concat(pcode.concat(point)))));
   var url = url_1.concat(url_2);
   location.href=url;
   
}
</script>
</head>

<body>
   <hr>
   <h4>배송지 정보 입력</h4>
   <div class="chkbx">
      <input type="checkbox" onclick="userInfoLoad()" name="samename" <%=uiLoad.equals("")?"":"checked value=\"on\"" %>>주문자 정보와 동일
   </div>
   <br>
   <form name="shopCartInfo" action="pointCartAddr_ok.jsp">
      <table class="shoppingCartInfo">
         <tr>
            <th>상품정보</th>
            <td>상품명:<%=request.getParameter("pname")%>| 코드:<%=request.getParameter("pcode")%>|
               수량:<%=request.getParameter("pnum")%>개| 총가격:<%=total%>원
               <input type="hidden" name="pname" value="<%=request.getParameter("pname")%>">
               <input type="hidden" name="path" value="<%=request.getParameter("path")%>">
               <input type="hidden" name="pnum" value="<%=request.getParameter("pnum")%>">
               <input type="hidden" name="price" value="<%=request.getParameter("price")%>">
               <input type="hidden" name="pcode" value="<%=request.getParameter("pcode")%>">
               <input type="hidden" name="total" value="<%=total%>">
               <input type="hidden" name="point" value="<%=request.getParameter("point")%>">
               <input type="hidden" name="sid" value="<%=sid_po%>">
               <input type="hidden" name="cu" value="<%=request.getRequestURL()%>">               
            </td>
         </tr>
         <%
            if (uiLoad == null || uiLoad.equals("")) {
               
         %>
         <tr>
            <th>주문자</th>
            <td><input type="text" name="name" required="required"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td><input type="text" name="addr1" required="required">
               - <input type="text" name="addr2" required="required"></td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td><input type="text" name="tel1" size="3" required="required">
               - <input type="text" name="tel2" size="3"> - <input
               type="text" name="tel3" size="3"></td>
         </tr>
         <tr>
            <th>배송시 유의사항</th>
            <td><input type="text" name="etc"></td>
         </tr>
         <%
            } else {
               MemberDTO mdto = mdao.memberInfo(sid_po);
         %>
         <tr>
            <th>주문자</th>
            <td><input type="text" name="name" required="required" value="<%=mdto.getName()%>"></td>
         </tr>
         <%
         String addr = mdto.getAddr();
         
         String addrarr[] = addr.split("|");
     
         %>
         <tr>
            <th>주소</th>
            <td><input type="text" name="addr1" required="required" value="<%=addrarr[0]%>">
               - <input type="text" name="addr2" required="required" value="<%=addrarr[1]%>"></td>
         </tr>
         <%
         String tel = mdto.getTel();
         String telarr[] = tel.split("-");
         %>
         <tr>
            <th>전화번호</th>
            <td><input type="text" name="tel1" size="3" required="required" value="<%=telarr[0]%>">
               - <input type="text" name="tel2" size="3" value="<%=telarr[1]%>"> - <input
               type="text" name="tel3" size="3" value="<%=telarr[2]%>"></td>
         </tr>
         <tr>
            <th>배송시 유의사항</th>
            <td><input type="text" name="etc"></td>
         </tr>
         <%
            }
         %>
      </table>
      <div class="shopCart_divbt">
         <input type="submit" value="주문하기" class="shopCart_okbt">
      </div>
   </form>
</body>
</html>