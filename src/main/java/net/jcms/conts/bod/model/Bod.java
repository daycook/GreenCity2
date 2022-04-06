package net.jcms.conts.bod.model;

import java.util.List;

import net.jcms.framework.base.model.BaseModel;
import net.jcms.framework.cd.model.CdDtl;

public class Bod extends BaseModel{

	private Long bodId;
	private String bodTp;
	private String bodNm;
	private String bodHeader;
	private String bodFooter;
	private Integer bodOrder;
	private Boolean cmntYn;
	private Boolean answYn;
	private Boolean scrtYn;
	private Integer artiCnt;
	private Integer fileUploadCnt;
	private String newArtiDt;
	private Boolean useSt;
	
	List<String> notiRoleList;
	List<String> writeRoleList;
	List<String> scrtRoleList;
	List<String> answRoleList;

	private CdDtl bodTpCd;

	public CdDtl getBodTpCd() {
		return bodTpCd;
	}

	public void setBodTpCd(CdDtl bodTpCd) {
		this.bodTpCd = bodTpCd;
	}

	public List<String> getNotiRoleList() {
		return notiRoleList;
	}

	public void setNotiRoleList(List<String> notiRoleList) {
		this.notiRoleList = notiRoleList;
	}

	public List<String> getWriteRoleList() {
		return writeRoleList;
	}

	public void setWriteRoleList(List<String> writeRoleList) {
		this.writeRoleList = writeRoleList;
	}

	public List<String> getScrtRoleList() {
		return scrtRoleList;
	}

	public void setScrtRoleList(List<String> scrtRoleList) {
		this.scrtRoleList = scrtRoleList;
	}

	public List<String> getAnswRoleList() {
		return answRoleList;
	}

	public void setAnswRoleList(List<String> answRoleList) {
		this.answRoleList = answRoleList;
	}
	
	public Integer getArtiCnt() {
		return artiCnt;
	}

	public void setArtiCnt(Integer artiCnt) {
		this.artiCnt = artiCnt;
	}

	public Long getBodId() {
		return bodId;
	}

	public void setBodId(Long bodId) {
		this.bodId = bodId;
	}

	public String getBodTp() {
		return bodTp;
	}

	public void setBodTp(String bodTp) {
		this.bodTp = bodTp;
	}

	public String getBodNm() {
		return bodNm;
	}

	public void setBodNm(String bodNm) {
		this.bodNm = bodNm;
	}

	public String getBodHeader() {
		return bodHeader;
	}

	public void setBodHeader(String bodHeader) {
		this.bodHeader = bodHeader;
	}

	public String getBodFooter() {
		return bodFooter;
	}

	public void setBodFooter(String bodFooter) {
		this.bodFooter = bodFooter;
	}

	public Boolean getCmntYn() {
		return cmntYn;
	}

	public void setCmntYn(Boolean cmntYn) {
		this.cmntYn = cmntYn;
	}

	public Boolean getAnswYn() {
		return answYn;
	}

	public void setAnswYn(Boolean answYn) {
		this.answYn = answYn;
	}

	public Boolean getScrtYn() {
		return scrtYn;
	}

	public void setScrtYn(Boolean scrtYn) {
		this.scrtYn = scrtYn;
	}

	public Integer getFileUploadCnt() {
		return fileUploadCnt;
	}

	public void setFileUploadCnt(Integer fileUploadCnt) {
		this.fileUploadCnt = fileUploadCnt;
	}

	public Boolean getUseSt() {
		return useSt;
	}

	public void setUseSt(Boolean useSt) {
		this.useSt = useSt;
	}

	public Integer getBodOrder() {
		return bodOrder;
	}

	public void setBodOrder(Integer bodOrder) {
		this.bodOrder = bodOrder;
	}

	public String getNewArtiDt() {
		return newArtiDt;
	}

	public void setNewArtiDt(String newArtiDt) {
		this.newArtiDt = newArtiDt;
	}

}
