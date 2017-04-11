package tt.sendpresent;

import java.sql.Date;

public class SendPresentDTO {
   
   private int idx;//인덱스
   private String raddress;//배송 주소
   private String id;//받는 사람
   private String stel;//보내는 사람 전화번호
   private String yourorder;//요구사항
   private String pname;//상품 이름
   private int pnumber;// 상품 수량
   private int rnum;//글 갯수
   private java.sql.Date senddate;
   private String userid;
   
   //생성자
   public SendPresentDTO() {
      super();
   }
   
   //오버로딩

   public SendPresentDTO(int idx, String raddress, String id, String stel, String yourorder, String pname,
         int pnumber, int rnum, Date senddate, String userid) {
      super();
      this.idx = idx;
      this.raddress = raddress;
      this.id = id;
      this.stel = stel;
      this.yourorder = yourorder;
      this.pname = pname;
      this.pnumber = pnumber;
      this.rnum = rnum;
      this.senddate = senddate;
      this.userid = userid;
   }

   //게터세터
   
   
   
   public int getIdx() {
      return idx;
   }

   public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public void setIdx(int idx) {
      this.idx = idx;
   }

   public String getRaddress() {
      return raddress;
   }

   public void setRaddress(String raddress) {
      this.raddress = raddress;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getStel() {
      return stel;
   }

   public void setStel(String stel) {
      this.stel = stel;
   }

   public String getYourorder() {
      return yourorder;
   }

   public void setYourorder(String yourorder) {
      this.yourorder = yourorder;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public int getPnumber() {
      return pnumber;
   }

   public void setPnumber(int pnumber) {
      this.pnumber = pnumber;
   }

   public int getRnum() {
      return rnum;
   }

   public void setRnum(int rnum) {
      this.rnum = rnum;
   }

   public Date getSenddate(){
	   return senddate;
   }
   
   public void setSenddate(Date senddate){
	   this.senddate = senddate;
   }
}