package com.yizhan.listener;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.yizhan.controller.base.BaseController;
import com.yizhan.service.information.zhaoyiwang.KeHuService;
import com.yizhan.util.Const;
import com.yizhan.util.DateTimeUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;
/**
 * 
* 类名称：监听器 设定定时执行任务WebAppContextListener.java
* 类描述： 定时器
* 作者：yym 
 */
public class WebAppContextListener extends BaseController implements ServletContextListener {
	private Timer timer = null;
	/*@Autowired
	private KeHuService kehuService;*/
	/*@Resource(name="kehuService")
	private KeHuService kehuService;
	*/
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
		 final KeHuService kehuService = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext()).getBean(KeHuService.class);
		// TODO Auto-generated method stub
		//Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//System.out.println("========获取Spring WebApplicationContext");
		
		//创建一个新计时器，可以指定其相关的线程作为守护程序运行。如果计时器将用于安排重复的“维护活动”，则调用守护线程，在应用程序运行期间必须调用守护线程，但是该操作不应延长程序的生命周期。   timer = new Timer(true);
		//创建一个新计时器，可以指定其相关的线程作为守护程序运行。   
		//设置任务计划，启动和间隔时间   
		
		//date.set(date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DATE), 0, 0, 0);
		long daySpan = 24 * 60 * 60 * 1000;
		final Calendar calendar = Calendar.getInstance();
		// get 和 set 的字段数字，指示一天中的小时。  
		//calendar.set(Calendar.HOUR_OF_DAY, 9);
		//get 和 set 的字段数字，指示一小时中的分钟。 
		//calendar.set(Calendar.MINUTE,3);
	    // get 和 set 的字段数字，指示一分钟中的秒。    
		//calendar.set(Calendar.SECOND, 0);
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE),16, 46, 0);
		Date time = calendar.getTime();
		System.out.println("------------执行时间----------"+time);
		System.out.println("------------执行时间----------"+time);
		
		Date startDate = calendar.getTime(); //第一次执行定时任务的时间 
		timer = new Timer(true);
		//在这里之执行定时器的操作
		// 安排在指定的时间执行指定的任务。执行任务前的延迟时间，单位是毫秒。
		/**
		 * run:执行操作
		 * startDate：开始执行时间
		 * daySpan：间隔执行时间
		 */
		
		
		/*timer.schedule(new TimerTask(){
			@Override
			public void run(){
				logBefore(logger,"--------开始执行定时任务了！！------");
	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
				PageData pd = new PageData();
				ModelAndView mv = new ModelAndView();
				try {
					
				}catch (Exception e){
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
		}, startDate, daySpan);*/
		
	}
	


	
	
	//SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
	//Date startDate = calendar.getTime(); //第一次执行定时任务的时间 
	
	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0){
		//终止此计时器，丢弃所有当前已安排的任务。  
		timer.cancel(); 
	}


}
