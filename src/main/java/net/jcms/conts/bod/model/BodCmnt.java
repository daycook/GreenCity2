package net.jcms.conts.bod.model;

import net.jcms.framework.base.model.BaseModel;
import net.jcms.framework.security.model.User;

public class BodCmnt extends BaseModel{

	private Long cmntId;
	private Long artiId;
	private Long cmntGrp;
	private Integer depth;
	private String cont;
	
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
	public Long getCmntId() {
		return cmntId;
	}
	public void setCmntId(Long cmntId) {
		this.cmntId = cmntId;
	}
	public Long getArtiId() {
		return artiId;
	}
	public void setArtiId(Long artiId) {
		this.artiId = artiId;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Long getCmntGrp() {
		return cmntGrp;
	}
	public void setCmntGrp(Long cmntGrp) {
		this.cmntGrp = cmntGrp;
	}
}
