package tt.message;

import java.sql.*;

public class MessageDTO {

	private int idx; // 쪽지번호
	private String receiver; // 보내는사람
	private String sender; // 받는사람
	private String subject; // 쪽지 제목
	private String content; // 쪽지 내용
	private Date writedate;
	
	
	public MessageDTO() {
		// TODO Auto-generated constructor stub
	}


	public MessageDTO(int idx, String receiver, String sender, String subject, String content, Date writedate) {
		super();
		this.idx = idx;
		this.receiver = receiver;
		this.sender = sender;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWritedate() {
		return writedate;
	}


	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	
	
	
}
