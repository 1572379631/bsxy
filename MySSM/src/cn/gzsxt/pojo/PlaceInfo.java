package cn.gzsxt.pojo;

public class PlaceInfo {
    private Integer placeId;

    private String placeName;

    private String placeLieu;

    private String placeDivision;
    
    private String placeInstallation;

    private String placeStatus;

    private String summoney;
    
    private String  applyStatus;
    
    private String placeAddtime;
    
    private String  placeAddperson;
    //审批人表字段乱入
    private String postulantName;
    
   

	public String getPostulantName() {
		return postulantName;
	}

	public void setPostulantName(String postulantName) {
		this.postulantName = postulantName;
	}

	public String getPlaceAddtime() {
		return placeAddtime;
	}

	public void setPlaceAddtime(String placeAddtime) {
		this.placeAddtime = placeAddtime;
	}

	public String getPlaceAddperson() {
		return placeAddperson;
	}

	public void setPlaceAddperson(String placeAddperson) {
		this.placeAddperson = placeAddperson;
	}

	public String getSummoney() {
		return summoney;
	}

	public void setSummoney(String summoney) {
		this.summoney = summoney;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName == null ? null : placeName.trim();
    }

    public String getPlaceLieu() {
        return placeLieu;
    }

    public void setPlaceLieu(String placeLieu) {
        this.placeLieu = placeLieu == null ? null : placeLieu.trim();
    }

    public String getPlaceDivision() {
        return placeDivision;
    }

    public void setPlaceDivision(String placeDivision) {
        this.placeDivision = placeDivision == null ? null : placeDivision.trim();
    }

    public String getPlaceStatus() {
        return placeStatus;
    }

    public void setPlaceStatus(String placeStatus) {
        this.placeStatus = placeStatus == null ? null : placeStatus.trim();
    }

    public String getPlaceInstallation() {
        return placeInstallation;
    }

    public void setPlaceInstallation(String placeInstallation) {
        this.placeInstallation = placeInstallation == null ? null : placeInstallation.trim();
    }
}