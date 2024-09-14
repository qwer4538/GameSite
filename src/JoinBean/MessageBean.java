package JoinBean;

import java.text.SimpleDateFormat;

public class MessageBean {
	private String idx;
	private String recv_id;
	private String send_id;
	private String title;
	private String content;
	private String recv_chk;
	private String send_date;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRecv_chk() {
		return recv_chk;
	}
	public void setRecv_chk(String recv_chk) {
		this.recv_chk = recv_chk;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
}