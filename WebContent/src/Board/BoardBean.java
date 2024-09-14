package Board;

public class BoardBean {
	private String board_no;
	private String board_type;
	private String board_title;
	private String board_content;
	private String board_file;
	private String board_rename_file;
	private String board_secret;
	private String board_visit;
	public String getBoard_visit() {
		return board_visit;
	}
	public void setBoard_visit(String board_visit) {
		this.board_visit = board_visit;
	}
	public String getBoard_secret() {
		return board_secret;
	}
	public void setBoard_secret(String board_secret) {
		this.board_secret = board_secret;
	}
	public String getBoard_rename_file() {
		return board_rename_file;
	}
	public void setBoard_rename_file(String board_rename_file) {
		this.board_rename_file = board_rename_file;
	}
	private String board_date;
	private String board_id;
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
}
