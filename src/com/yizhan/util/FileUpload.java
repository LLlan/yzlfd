package com.yizhan.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件
 * 创建人：FH 创建时间：2014年12月23日
 * @version
 */
public class FileUpload {

	/**上传文件到指定路径
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp1(MultipartFile file, String filePath, String fileName){
		String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;
	}
	
	/**
	 * 写文件到当前目录的upload目录中
	 * 
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
	
	
	/*//上传置顶图片
	public static String fileUp(MultipartFile file, String filePath, String fileName) throws IOException {
		//mkdirs(filePath);
		
		//获取上传图片的后缀名
		String subfix =file.getOriginalFilename().toString().substring(file.getOriginalFilename().lastIndexOf(".")+1);	
		File file1 = new File(filePath, fileName+"."+subfix);
		if (!file1.exists()) {
			if (!file1.getParentFile().exists()) {
				file1.getParentFile().mkdirs();
			}
			file1.createNewFile();
		}
			try {
				 *//**对上传的图片进行处理，可以获取图片的宽、高、格式等**//*    
	            Image srcFile = ImageIO.read(file.getInputStream());
	            int w = srcFile.getWidth(null);    
	            int h = srcFile.getHeight(null);
	            
	            //int width=w;
	            //int height=h;
	            int width=w/10;
	            int height=0;
	            
	            double bili=0;
	            bili=width/(double)w;    
                height = (int) (h*bili);

                BufferedImage buffImg = null;   
	            if(subfix.equals("png")){//创建一个带透明色的BufferedImage对象  
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);  
	            }else{  //创建一个不带透明色的BufferedImage对象
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
	            }
	            //压缩图片
	            Graphics2D graphics = buffImg.createGraphics();  
	            graphics.setBackground(new Color(255,255,255));  
	            graphics.setColor(new Color(255,255,255));  
	            graphics.fillRect(0, 0, width, height);  
	            graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);    
	            //把图片写入指定的路径中
	            ImageIO.write(buffImg, subfix, new File(filePath+fileName+"."+subfix));
			} catch (Exception e) {
				e.printStackTrace();
			}
		return fileName+"."+subfix;
	}
	public static void mkdirs(String destPath) {  
        File file =new File(destPath);      
        //当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)  
        if (!file.exists() && !file.isDirectory()) {  
            file.mkdirs();  
        }  
    } */ 
	
	//上传并压缩图片
	public static String fileUp(MultipartFile file, String filePath, String fileName) throws IOException {
		InputStream in=file.getInputStream();
		filePath = filePath+"/";
		
		//获取上传图片的后缀名
		String subfix =file.getOriginalFilename().toString().substring(file.getOriginalFilename().lastIndexOf("."));	
		File file1 = new File(filePath, fileName+subfix);
		if (!file1.exists()) {
			if (!file1.getParentFile().exists()) {
				file1.getParentFile().mkdirs();
			}
			file1.createNewFile();
		}
		
		File file2 = new File(filePath, fileName+subfix);
		FileUtils.copyInputStreamToFile(in, file2);
		
		String newFileName=UuidUtil.get32UUID();
		
		Thumbnails.of(filePath+fileName+subfix)  
	    .scale(1f)  
	    .outputQuality(0.25f)  
	    .toFile(filePath+newFileName+subfix);
		
		if(Tools.notEmpty(filePath+fileName+subfix)){
			FileUtil.delFile(filePath+fileName+subfix);
		}
		//System.out.println("===============sdsfsdf"+filePath+fileName+subfix);
		return newFileName+subfix;
	}
	
	public static void mkdirs(String destPath) {  
        File file =new File(destPath);      
        //当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)  
        if (!file.exists() && !file.isDirectory()) {  
            file.mkdirs();  
        }  
    }  
	
	
}
