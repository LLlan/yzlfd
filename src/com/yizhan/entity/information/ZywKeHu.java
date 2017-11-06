package com.yizhan.entity.information;

/**
 * 找医网客户端用户信息
 * @类名称： ZywKeHu
 * @作者：lj 
 * @时间： 2017-5-31 下午2:57:09
 *
 */
public class ZywKeHu {
	private String user_kuhu_id;
	private String phone;
	private String userName;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUser_kuhu_id() {
		return user_kuhu_id;
	}
	public void setUser_kuhu_id(String user_kuhu_id) {
		this.user_kuhu_id = user_kuhu_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
