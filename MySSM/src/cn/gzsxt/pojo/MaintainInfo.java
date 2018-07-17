package cn.gzsxt.pojo;

import java.util.Date;

public class MaintainInfo {
    private Integer mtId;

    private Integer placeId;

    private String placeinstallationadd;

    private String placeinstallationrep;

    private String summoneyadd;

    private String summoneyrep;

    private String mtmaintenance;

    private String mttimestart;

    private String mttimeend;

    private String mtdept;

    private String mtpersontell;

    private String mtsummoney;
    
    private String recordtime;

    private String approvalperson;
    //场地表字段乱入
    private String placeName;

    private String placeLieu;

    private String placeDivision;
    
    private String placeInstallation;
    
    private String summoney;
    //审批人字段乱入
    private String postulantName;

    
    public String getSummoney() {
		return summoney;
	}

	public void setSummoney(String summoney) {
		this.summoney = summoney;
	}

	public String getPostulantName() {
		return postulantName;
	}

	public void setPostulantName(String postulantName) {
		this.postulantName = postulantName;
	}

	public String getRecordtime() {
		return recordtime;
	}

	public void setRecordtime(String recordtime) {
		this.recordtime = recordtime;
	}

	public String getApprovalperson() {
		return approvalperson;
	}

	public void setApprovalperson(String approvalperson) {
		this.approvalperson = approvalperson;
	}

	public Integer getMtId() {
        return mtId;
    }

    public void setMtId(Integer mtId) {
        this.mtId = mtId;
    }

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public String getPlaceinstallationadd() {
        return placeinstallationadd;
    }

    public void setPlaceinstallationadd(String placeinstallationadd) {
        this.placeinstallationadd = placeinstallationadd == null ? null : placeinstallationadd.trim();
    }

    public String getPlaceinstallationrep() {
        return placeinstallationrep;
    }

    public void setPlaceinstallationrep(String placeinstallationrep) {
        this.placeinstallationrep = placeinstallationrep == null ? null : placeinstallationrep.trim();
    }

    public String getSummoneyadd() {
        return summoneyadd;
    }

    public void setSummoneyadd(String summoneyadd) {
        this.summoneyadd = summoneyadd == null ? null : summoneyadd.trim();
    }

    public String getSummoneyrep() {
        return summoneyrep;
    }

    public void setSummoneyrep(String summoneyrep) {
        this.summoneyrep = summoneyrep == null ? null : summoneyrep.trim();
    }

    public String getMtmaintenance() {
        return mtmaintenance;
    }

    public void setMtmaintenance(String mtmaintenance) {
        this.mtmaintenance = mtmaintenance == null ? null : mtmaintenance.trim();
    }

   /* public Date getMttimestart() {
        return mttimestart;
    }

    public void setMttimestart(Date mttimestart) {
        this.mttimestart = mttimestart;
    }

    public Date getMttimeend() {
        return mttimeend;
    }

    public void setMttimeend(Date mttimeend) {
        this.mttimeend = mttimeend;
    }*/
    

    public String getMtdept() {
        return mtdept;
    }

    public String getMttimestart() {
		return mttimestart;
	}

	public void setMttimestart(String mttimestart) {
		this.mttimestart = mttimestart;
	}

	public String getMttimeend() {
		return mttimeend;
	}

	public void setMttimeend(String mttimeend) {
		this.mttimeend = mttimeend;
	}

	public void setMtdept(String mtdept) {
        this.mtdept = mtdept == null ? null : mtdept.trim();
    }

    public String getMtpersontell() {
        return mtpersontell;
    }

    public void setMtpersontell(String mtpersontell) {
        this.mtpersontell = mtpersontell == null ? null : mtpersontell.trim();
    }

    public String getMtsummoney() {
        return mtsummoney;
    }

    public void setMtsummoney(String mtsummoney) {
        this.mtsummoney = mtsummoney == null ? null : mtsummoney.trim();
    }

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceLieu() {
		return placeLieu;
	}

	public void setPlaceLieu(String placeLieu) {
		this.placeLieu = placeLieu;
	}

	public String getPlaceDivision() {
		return placeDivision;
	}

	public void setPlaceDivision(String placeDivision) {
		this.placeDivision = placeDivision;
	}

	public String getPlaceInstallation() {
		return placeInstallation;
	}

	public void setPlaceInstallation(String placeInstallation) {
		this.placeInstallation = placeInstallation;
	}
    
    
}