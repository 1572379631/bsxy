package cn.gzsxt.pojo;

public class PostulantuserInfo {
    private Integer postulantId;

    private String postulantName;

    private String postulantPwd;

    private String postulantDept;

    private String postulantFaculte;
    
    private String postulantTell;
    
    private String postulantEmaill;
    
    

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
        this.postulantName = postulantName == null ? null : postulantName.trim();
    }

    public String getPostulantPwd() {
        return postulantPwd;
    }

    public void setPostulantPwd(String postulantPwd) {
        this.postulantPwd = postulantPwd == null ? null : postulantPwd.trim();
    }

    public String getPostulantDept() {
        return postulantDept;
    }

    public void setPostulantDept(String postulantDept) {
        this.postulantDept = postulantDept == null ? null : postulantDept.trim();
    }

    public String getPostulantFaculte() {
        return postulantFaculte;
    }

    public void setPostulantFaculte(String postulantFaculte) {
        this.postulantFaculte = postulantFaculte == null ? null : postulantFaculte.trim();
    }

	@Override
	public String toString() {
		return "PostulantuserInfo [postulantId=" + postulantId
				+ ", postulantName=" + postulantName + ", postulantPwd="
				+ postulantPwd + ", postulantDept=" + postulantDept
				+ ", postulantFaculte=" + postulantFaculte + ", postulantTell="
				+ postulantTell + ", postulantEmaill=" + postulantEmaill + "]";
	}
    
   
}