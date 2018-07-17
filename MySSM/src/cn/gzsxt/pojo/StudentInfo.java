package cn.gzsxt.pojo;

public class StudentInfo {
    private Integer studentId;

    private String studentNum;

    private String studentName;

    private String studentFaculte;

    private String studentClass;

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum == null ? null : studentNum.trim();
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    public String getStudentFaculte() {
        return studentFaculte;
    }

    public void setStudentFaculte(String studentFaculte) {
        this.studentFaculte = studentFaculte == null ? null : studentFaculte.trim();
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass == null ? null : studentClass.trim();
    }
}