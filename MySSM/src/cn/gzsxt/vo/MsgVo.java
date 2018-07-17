package cn.gzsxt.vo;

public class MsgVo {

	private int status;
	private String message;
	private int value;

	public MsgVo() {
	}

	public MsgVo(int status, String message, int value) {
		super();
		this.status = status;
		this.message = message;
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public MsgVo(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
