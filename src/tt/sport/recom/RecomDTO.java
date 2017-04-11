package tt.sport.recom;

public class RecomDTO {
	
	private int idx; // 고유번호
	private String idcode; // 추천한사람id + 해당 sport게시글
	
	public RecomDTO(){
		
	}

	public RecomDTO(int idx, String idcode) {
		super();
		this.idx = idx;
		this.idcode = idcode;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getIdcode() {
		return idcode;
	}

	public void setIdcode(String idcode) {
		this.idcode = idcode;
	}
}
