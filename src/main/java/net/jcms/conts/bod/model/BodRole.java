package net.jcms.conts.bod.model;

public class BodRole {

	private Long bodId;
	private String roleAuth;
	private String authTp;
	
	public Long getBodId() {
		return bodId;
	}
	public void setBodId(Long bodId) {
		this.bodId = bodId;
	}
	public String getRoleAuth() {
		return roleAuth;
	}
	public void setRoleAuth(String roleAuth) {
		this.roleAuth = roleAuth;
	}
	public String getAuthTp() {
		return authTp;
	}
	public void setAuthTp(String authTp) {
		this.authTp = authTp;
	}
	
}
