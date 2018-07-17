package cn.gzsxt.pojo;

import java.util.Date;

public class PlaceApplyInfo {
    private Integer placeApplyId;

    private Integer postulantId;

    private String teamYesnot;

    private Integer deptId;

    private Date applyTimeStart;

    private Date applyTimeEnd;

    private Integer placeId;

    private String placePurpose;

    private String useResult;

    private String placeLieu;

    private String reamk;

    private String placeName;

    private String placeDivision;

    private String applyplacetype;

    private String applyTime;

    private String applyStatus;

    private Date approvalTime;

    private String approvalPerson;

    private String principalTell;

    private String activityName;

    private String activityContent;

    private String activityNature;

    private String sponsor;

    private String participant;

    private String participantSum;
    
    private String advise;
    
    private String deptName;

    public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getAdvise() {
		return advise;
	}

	public void setAdvise(String advise) {
		this.advise = advise;
	}

	public Integer getPlaceApplyId() {
        return placeApplyId;
    }

    public void setPlaceApplyId(Integer placeApplyId) {
        this.placeApplyId = placeApplyId;
    }

    public Integer getPostulantId() {
        return postulantId;
    }

    public void setPostulantId(Integer postulantId) {
        this.postulantId = postulantId;
    }

    public String getTeamYesnot() {
        return teamYesnot;
    }

    public void setTeamYesnot(String teamYesnot) {
        this.teamYesnot = teamYesnot == null ? null : teamYesnot.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Date getApplyTimeStart() {
        return applyTimeStart;
    }

    public void setApplyTimeStart(Date applyTimeStart) {
        this.applyTimeStart = applyTimeStart;
    }

    public Date getApplyTimeEnd() {
        return applyTimeEnd;
    }

    public void setApplyTimeEnd(Date applyTimeEnd) {
        this.applyTimeEnd = applyTimeEnd;
    }

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public String getPlacePurpose() {
        return placePurpose;
    }

    public void setPlacePurpose(String placePurpose) {
        this.placePurpose = placePurpose == null ? null : placePurpose.trim();
    }

    public String getUseResult() {
        return useResult;
    }

    public void setUseResult(String useResult) {
        this.useResult = useResult == null ? null : useResult.trim();
    }

    public String getPlaceLieu() {
        return placeLieu;
    }

    public void setPlaceLieu(String placeLieu) {
        this.placeLieu = placeLieu == null ? null : placeLieu.trim();
    }

    public String getReamk() {
        return reamk;
    }

    public void setReamk(String reamk) {
        this.reamk = reamk == null ? null : reamk.trim();
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName == null ? null : placeName.trim();
    }

    public String getPlaceDivision() {
        return placeDivision;
    }

    public void setPlaceDivision(String placeDivision) {
        this.placeDivision = placeDivision == null ? null : placeDivision.trim();
    }

    public String getApplyplacetype() {
        return applyplacetype;
    }

    public void setApplyplacetype(String applyplacetype) {
        this.applyplacetype = applyplacetype == null ? null : applyplacetype.trim();
    }

    public String getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus == null ? null : applyStatus.trim();
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public String getApprovalPerson() {
        return approvalPerson;
    }

    public void setApprovalPerson(String approvalPerson) {
        this.approvalPerson = approvalPerson == null ? null : approvalPerson.trim();
    }

    public String getPrincipalTell() {
        return principalTell;
    }

    public void setPrincipalTell(String principalTell) {
        this.principalTell = principalTell == null ? null : principalTell.trim();
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName == null ? null : activityName.trim();
    }

    public String getActivityContent() {
        return activityContent;
    }

    public void setActivityContent(String activityContent) {
        this.activityContent = activityContent == null ? null : activityContent.trim();
    }

    public String getActivityNature() {
        return activityNature;
    }

    public void setActivityNature(String activityNature) {
        this.activityNature = activityNature == null ? null : activityNature.trim();
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor == null ? null : sponsor.trim();
    }

    public String getParticipant() {
        return participant;
    }

    public void setParticipant(String participant) {
        this.participant = participant == null ? null : participant.trim();
    }

    public String getParticipantSum() {
        return participantSum;
    }

    public void setParticipantSum(String participantSum) {
        this.participantSum = participantSum == null ? null : participantSum.trim();
    }
}