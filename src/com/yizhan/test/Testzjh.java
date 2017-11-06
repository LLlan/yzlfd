package com.yizhan.test;


import net.sf.json.JSONObject;

import com.yizhan.controller.rong.util.GetTokenUtil;
import com.yizhan.util.PathUtil;
import com.yizhan.util.QRCodeUtil;

public class Testzjh {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		
		
		String imgPath="http://60.205.180.48:80/yzlfd/uploadFiles/uploadImgs/shangHu/headImg/20170905/9dd27741e80e47839610811f0f79118b.jpg";
		QRCodeUtil.encode("abc", imgPath, "D://", "1111.jpg", true);
	}
	        
}
