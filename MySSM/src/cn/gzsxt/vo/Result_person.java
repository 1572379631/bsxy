package cn.gzsxt.vo;

public class Result_person {

	private Integer postulantId;//id
	private String postulantName;//登录人姓名
	private String postulantNum;//学号或工号
    private String postulantTell;//电话
    private String postulantEmaill;//联系电话
    private String className;//班级
    private String deptName;//所属部门
    private String faculteName;//所属院系
	public Integer getPostulantId() {
		return postulantId;
	}
	public void setPostulantId(Integer postulantId) {
		this.postulantId = postulantId;
	}
	public String getPostulantName() {
		return postulantName;
	}
	public void setPostulantName(String postulantName) {
		this.postulantName = postulantName;
	}
	public String getPostulantNum() {
		return postulantNum;
	}
	public void setPostulantNum(String postulantNum) {
		this.postulantNum = postulantNum;
	}
	public String getPostulantTell() {
		return postulantTell;
	}
	public void setPostulantTell(String postulantTell) {
		this.postulantTell = postulantTell;
	}
	public String getPostulantEmaill() {
		return postulantEmaill;
	}
	public void setPostulantEmaill(String postulantEmaill) {
		this.postulantEmaill = postulantEmaill;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getFaculteName() {
		return faculteName;
	}
	public void setFaculteName(String faculteName) {
		this.faculteName = faculteName;
	}
}
