package cn.gzsxt.pojo;

public class TeacherInfo {
    private Integer teacherId;

    private String teacherName;

    private String teacherNum;

    private String teacherFaculte;

    private String teacherDept;

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public String getTeacherNum() {
        return teacherNum;
    }

    public void setTeacherNum(String teacherNum) {
        this.teacherNum = teacherNum == null ? null : teacherNum.trim();
    }

    public String getTeacherFaculte() {
        return teacherFaculte;
    }

    public void setTeacherFaculte(String teacherFaculte) {
        this.teacherFaculte = teacherFaculte == null ? null : teacherFaculte.trim();
    }

    public String getTeacherDept() {
        return teacherDept;
    }

    public void setTeacherDept(String teacherDept) {
        this.teacherDept = teacherDept == null ? null : teacherDept.trim();
    }
}