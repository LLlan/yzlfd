<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <link href="static/zhaoyiwang/zywkehuduan/css/index1.css" type="text/css" rel="stylesheet"/>
    <link href="static/zhaoyiwang/zywkehuduan/css/common1.css" type="text/css" rel="stylesheet"/>
	
    <title>发布需求</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/zywkehuduan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        .sex,.nianlin {
             padding-left: 11px;
             background: url(static/zhaoyiwang/zywkehuduan/images/xing_03.png) no-repeat left;
         }
        .releaseBox p label{
            display: inline-block;
            width: 23%;
            text-align: left;
        }
        .releaseBox p label.bioati{
        	 width: 20%;
        }
        .inp>input.commont {
		    width: 75%;
		    height: 30px;
		    line-height: 30px;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
		   
		    outline: none;
		}
		.inp>input {
		    width: 75%;
		    height: 30px;
		    line-height: 30px;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
		    margin-left: 0;
		    outline: none;
		}
		.biaoQ {
            width: 100%;
            height: 66px;
            line-height: 66px;
            color: #000;
            padding-left: 20px;
            background-color: #fff;
            margin-top: 2px;
        }
        .biaoQ a {
            display: inline-block;
            width: 140px;
            height: 42px;
            line-height: 42px;
            border: 1px solid #c2c2c2;
            border-radius: 3px;
            margin-left: 23px;
            margin-top: 10px;
            padding-left: 12px;
            color: #000;
            /*background: #f6f6f6 url(../../images/wmpc/xia_03.png) 90% 15px no-repeat;*/
            background-size: 16px 11px;
        }
        .mask{
            position:fixed;z-index:600;left:0;top:0;width:100%;height:100%;background:rgba(0,0,0,0.5)
        }
        
        .sexCls{
        	padding: 5px 3px;
		    background-color: #fff;
		    color: #000;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
        }
        .up-section .close-upimg{
			position: absolute;
			top: 1px;
		    right: 2px;
		    width: 20px;
		    height: 30px;
			display: none;
			z-index: 10;
		}
		 .backlast{
      	  position:relative;top:-4px;left:19px;color:#fff;font-size: 15px;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span class="backlast">返回</span></a></div>
    <div class="wy-header-title">发布需求</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="bigBox01" >
     <div class="releaseBox">
     <form  id="xuqiuform" action="<%=basePath%>/api/zywkehu/${actionMsg }.do" method="post" enctype="multipart/form-data">
     <input type="hidden" value="${pd.xuqiu_id }" name="xuqiu_id">
      	<c:if test="${actionMsg=='updateXuqiu' }">
       		<p class="biaoQ bing">分类<a href="javascript:;" id='show-actions1' class="type">${pd.type }</a></p>
       		
			<input type="hidden" id="types" name="type" value="${pd.type }">
       	</c:if>
        <c:if test="${actionMsg!='updateXuqiu' }">
       		<p class="biaoQ bing">分类<a href="javascript:;" id='show-actions1' class="type">找医生</a></p>
       		
			<input type="hidden" id="types" name="type" value="找医生">
       	</c:if>
		<div class="weui-cells1" style="display:none;position: fixed;bottom:0;left: 0;background-color: #fff;z-index: 99999;width: 100%;">
		    <div id="xiala1" style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center">
		        <div>找医生</div>
		    </div>
		    <div id="xiala2"  style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center">
		        <div>找机构</div>
		    </div>
		    <div id="xiala3"  style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center">
		        <div>找药商</div>
		    </div>
		    <!--<div id="quxiao" style="background-color: #42e264;color: #fff;width: 100%;height:56px;line-height:56px;text-align: center;">
		        <p class="cancel1">取消</p>
		    </div>-->
		</div>
		<p class="inp bing"><label for="deseaseH" class="bioati";>标题： </label><input type="text" id="deseaseH" name="disease" value="${pd.disease }" placeholder="请输入标题（如：找医生）" /></p>
        <p class="bing">内容 :</p>
        <textarea type="text" maxlength="120" name="symptom" id="symptom" placeholder="请输入您的具体需求，如腰疼，肚子疼等。" class="areaBox"/>${pd.symptom }</textarea>
        <p class="tishi"><img src="static/zhaoyiwang/zywkehuduan/images/zys/tishi_03.png" alt=""/>120个字符（包括字母、数字、下划线），不区分大小写</p>
        <p class="chuan">上传病情相关的照片 :</p>
        <div class="picBingBox">
            <div class="img-box full" style="margin:0;width:100%;background-color: #fff;">
                <section class=" img-section">
                    <div class="z_photo upimg-div clear" style="border:none; ">
                    	<c:forEach items="${imgList }" var="va">
                    		<section class="z_file fl"  style="margin:0;width:80px;display: none" ></section>
	                        <section class="up-section fl">
	                        	<span class="up-span"></span>
	                        	<img onclick="del(this);" class="close-upimg" tid="${va.xuqiu_img_id }" src="static/zhaoyiwang/zywkehuduan/images/zys/a7.png">
	                        	<img class="up-img" src="${va.img_url }">
	                        </section>
                    	</c:forEach>
                   		<c:if test="${imgList.size()!=4 }">
                   			<section class="z_file fl"  style="margin:0;width:80px;">
	                            <img src="static/zhaoyiwang/zywkehuduan/images/zys/add01.png" class="add-img" style="margin:0;width:80px;border:1px solid #eee;">
	                            <input onchange="imgUponchange(this);" type="file" name="imgFile" class="file" accept="image/*" style="margin:0;width:100%;"/>
	                        </section>
                   		</c:if>
                    </div>
                </section>
            </div>
            <aside class="amask works-mask">
                <div class="mask-content">
                    <p class="del-p ">您确定要删除作品图片吗？</p>
                    <p class="check-p"><span onclick="ok();" class="del-com wsdel-ok">确定</span><span onclick="no();" class="wsdel-no">取消</span></p>
                </div>
            </aside>
        </div>
        <!--<p class="xinxiBox"><span>性别 : </span><a href="javascript:void(0)" class="sex" id="show-actions1">男</a><span style="margin-left:26px;">年龄 : </span><a href="javascript:void(0)" class="age" id="show-actions2">23</a></p>-->
        <p class="xinxiBox" style="margin-top:10px;">
        <span>所在城市 : </span>
        <select name="province" id="sheng"  onchange="addCutty(this)" style="margin-left:13px;width:30%;">
        	<c:choose>
        		<c:when test="${pd!=null }">
        			<option value="${pd.sheng }" selected="selected">${pd.sheng }</option>
        		</c:when>
        		<c:otherwise>
        			<option value="" >-省份-</option>
        		</c:otherwise>
        	</c:choose>
        </select>
        <select name="city" id="shi" style="margin-left:10px;width:25%;">
            <c:choose>
        		<c:when test="${pd!=null }">
        			<option value="${pd.shi }" selected="selected">${pd.shi }</option>
        		</c:when>
        		<c:otherwise>
        			<option value="">-城市-</option>
        		</c:otherwise>
        	</c:choose>
        </select>
        </p>
        <input type="hidden" id="pro_city" name="address">
        <p class="inp sex"><label >性别: </label>
        <select name="sex"  style="width:25%;" class="sexCls">
        	<option <c:if test="${pd.sex=='男' }">selected</c:if>>男</option>
        	<option <c:if test="${pd.sex=='女' }">selected</c:if>>女</option>
        </select></p>
        <p class="inp nianlin"><label>年龄: </label><input type="text" name="age" id="age" value="${pd.age }"/></p>
        <p class="inp bing"><label for="nameH">姓名 : </label><input class="commont" type="text" id="nameH" name="patient_name" value="${pd.patient_name }"/></p>
        <p class="inp bing"><label for="telNumH">手机号码 : </label><input  class="commont"  type="text" id="telNumH" name="phone" value="${pd.phone }"/></p>
        <!-- <p class="inp"><label for="yanZMH">验证码 : </label><input type="text" style="width:21%" id="yanZMH" name=""/> -->
        <!-- <img src="../images/zys/u132.png" alt=""/> -->
        </p>
       
    </div>
    <div class="login"><a href="javascript:void(0)" id="subBtn" style="background-color: #feb930;margin-top:30px;">确认提交</a></div>
  </form>
  
  
    <div style="margin-top: 20px;background-color: white;">
    </div>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/zywkehuduan/js/imgUp-fbxq.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	
	$("#subBtn").click(function(){
		if($("#deseaseH").val()==""){
			$("#deseaseH").tips({
				side:3,
	            msg:'标题不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		if($("#symptom").val()==""){
			$("#symptom").tips({
				side:3,
	            msg:'内容介绍不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		if($("#sheng").val()==""){
			$("#sheng").tips({
				side:3,
	            msg:'城市不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		if($("#shi").val()==""){
			$("#shi").tips({
				side:3,
	            msg:'城市不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		var ageReg=/^\+?[1-9]\d*$/;
		if(!ageReg.test($("#age").val()) || (ageReg.test($("#age").val()) && parseFloat($("#age").val())>100)){
			$("#age").tips({
				side:3,
	            msg:'请正确输入年龄',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		if($("#nameH").val()==""){
			$("#nameH").tips({
				side:3,
	            msg:'姓名不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		var phoneReg=/^1[3-9]\d{9}$/;
		if(!phoneReg.test($("#telNumH").val())){
			$("#telNumH").tips({
				side:3,
	            msg:'请正确输入手机号码',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//把选择好的城市赋值到隐藏域中
		if($("#sheng").val().split(",").length>1){
			$("#pro_city").val($("#sheng").val().split(",")[1]+" "+$("#shi").val());
		}else{
			$("#pro_city").val($("#sheng").val().split(",")[0]+" "+$("#shi").val());
		}
		//loading带文字
		 layer.open({
		    type: 2
		    ,content: '加载中'
		    ,shadeClose: false
		  });
		 setTimeout('$("#xuqiuform").submit();', 1000);
		
	});

    var pre=["北京市","天津市","上海市","重庆市","河北省","河南省","云南省","辽宁省","黑龙江省","湖南省","安徽省","山东省","新疆维吾尔自治区","江苏省","浙江省","江西省","湖北省","广西壮族","甘肃省","山西省","内蒙古自治区","陕西省","吉林省","福建省","贵州省","广东省","青海省","西藏","四川省","宁夏回族","海南省","台湾省","香港特别行政区","澳门特别行政区"];
    var citys=[
        ['东城区', '西城区','崇文区','宣武区','朝阳区','丰台区','石景山区', '海淀区','门头沟区', '房山区','通州区','顺义区','昌平区','大兴 区','怀柔区','平谷区','密云县','延庆县'],
        ['和平区','河东区', '河西区', '南开区', '河北区', '红桥区', '塘沽区', '汉沽区', '大港区', '东丽区', '西青区', '津南区', '北辰区', '武清区', '宝坻区', '宁河县', '静海县', '蓟县'],
        ['黄浦区','卢湾区', '徐汇区','长宁区','静安区','普陀区','闸北区','虹口区', '杨浦区', '闵行区', '宝山区', '嘉定区', '浦东新区', '金山区', '松江区', '青浦区', '南汇区', '奉贤区', '崇明县'],
        ['万州区','涪陵区','渝中区','大渡口区','江北区','沙坪坝区','九龙坡区','南岸区','北碚区','万盛区','双桥区','渝北区','巴南区','黔江区','长寿区','江津区','合川区','永川区','南川区','綦江县','潼南县','铜梁县','大足县','荣昌县','璧山县','梁平县','城口县','丰都县','垫江县','武隆县','忠县','开县','云阳县','奉节县','巫山县','巫溪县','石柱土家族自治县','秀山土家族苗族自治县','酉阳土家族苗族自治县','彭水苗族土家族自治县'],
        ['石家庄市', '唐山市', '秦皇岛市', '邯郸市', '邢台市', '保定市', '张家口市', '承德市', '沧州市', '廊坊市', '衡水市'],
        ['郑州市','开封市','洛阳市', '平顶山市', '安阳市', '鹤壁市', '新乡市', '焦作市', '济源市', '濮阳市', '许昌市', '漯河市', '三门峡市', '南阳市', '商丘市', '信阳市', '周口市', '驻马店市'],
        ['昆明市',' 曲靖市','玉溪市','保山市','昭通市','丽江市','思茅市','临沧市','楚雄彝族自治州','红河哈尼族彝族自治州','文山壮族苗族自治州','西双版纳傣族自治州','大理白族自治州','德宏傣族景颇族自治州','怒江傈僳族自治州','迪庆藏族自治州'],
        ['沈阳市' ,'大连市' ,'鞍山市' ,'抚顺市' ,'本溪市' ,'丹东市' ,'锦州市' ,'营口市' ,'阜新市' ,'辽阳市' ,'盘锦市' ,'铁岭市' ,'朝阳市' ,'葫芦岛市'],
        ['哈尔滨市','齐齐哈尔市','鸡西市','鹤岗市','双鸭山市', '大庆市', '伊春市', '佳木斯市', '七台河市', '牡丹江市', '黑河市', '绥化市', '大兴安岭地区'],
        ['长沙市', '株洲市','湘潭市', '衡阳市', '邵阳市', '岳阳市', '常德市', '张家界市', '益阳市', '郴州市', '永州市', '怀化市', '娄底市', '湘西土家族苗族自治州'],
        ['合肥市', '芜湖市', '蚌埠市', '淮南市', '马鞍山市', '淮北市', '铜陵市', '安庆市', '黄山市', '滁州市','阜阳市','宿州市', '巢湖市', '六安市', '亳州市', '池州', '宣城市'],
        ['济南市','青岛市','淄博市','枣庄市','东营市','烟台市','潍坊市','济宁市','泰安市','威海市','日照市','莱芜市','临沂市','德州市','聊城市','滨州市','菏泽市'],
        ['乌鲁木齐市', '克拉玛依市', '吐鲁番地区', '哈密地区', '昌吉回族自治州 ', '博尔塔拉蒙古自治州 ', '巴音郭楞蒙古自治州 ', '阿克苏地区', '克孜勒苏柯尔克孜自治州 ', '喀什地区', '和田地区', '伊犁哈萨克自治州', '塔城地区', '阿勒泰地区', '石河子市', '阿拉尔市', '图木舒克市', '五家渠市' ],
        ['南京市', '无锡市', '徐州市', '常州市', '苏州市', '南通市', '连云港市', '淮安市', '盐城市', '扬州市', '镇江市', '泰州市', '宿迁市' ],
        ['杭州市', '宁波市', '温州市', '嘉兴市', '湖州市', '绍兴市', '金华市', '衢州市', '舟山市', '台州市', '丽水市'],
        ['南昌市','景德镇市','萍乡市','九江市','新余市','鹰潭市','赣州市','吉安市','宜春市','抚州市','上饶市'],
        ['武汉市','黄石市','十堰市', '宜昌市', '襄樊市', '鄂州市', '荆门市', '孝感市', '荆州市', '黄冈市', '咸宁市', '随州市', '恩施土家族苗族自治州','仙桃市', '潜江市', '天门市', '神农架林区'],
        ['南宁市','柳州市','桂林市','梧州市','北海市','防城港市','钦州市','贵港市','玉林市','百色市','贺州市','河池市','来宾市','崇左市'],
        ['兰州市','嘉峪关市', '金昌市', '白银市', '天水市', '武威市', '张掖市', '平凉市', '酒泉市', '庆阳市', '定西市', '陇南市', '临夏回族自治州', '甘南藏族自治州'],
        ['太原市','大同市', '阳泉市', '长治市', '晋城市', '朔州市', '晋中市', '运城市', '忻州市', '临汾市', '吕梁市' ],
        ['呼和浩特市', '包头市', '乌海市', '赤峰市', '通辽市', '鄂尔多斯市', '呼伦贝尔市', '巴彦淖尔市', '乌兰察布市', '兴安盟', '锡林郭勒盟', '阿拉善盟' ],
        ['西安市','铜川市','宝鸡市', '咸阳市', '渭南市', '延安市', '汉中市', '榆林市', '安康市', '商洛市' ],
        ['长春市', '吉林市', '四平市', '辽源市', '通化市', '白山市', '松原市', '白城市', '延边朝鲜族自治州'],
        ['福州市', '厦门市', '莆田市', '三明市', '泉州市', '漳州市', '南平市', '龙岩市', '宁德市' ],
        ['贵阳市','六盘水市', '遵义市', '安顺市', '铜仁地区', '黔西南布依族苗族自治州', '毕节地区', '黔东南苗族侗族自治州', '黔南布依族苗族自治州'],
        ['广州市','韶关市','深圳市','珠海市','汕头市','佛山市','江门市','湛江市','茂名市','肇庆市','惠州市','梅州市','汕尾市','河源市','阳江市','清远市','东莞市','中山市','潮州市','揭阳市','云浮市'],
        ['西宁市' ,'海东地区', '海北藏族自治州', '黄南藏族自治州', '海南藏族自治州', '果洛藏族自治州', '玉树藏族自治州', '海西蒙古族藏族自治州'],
        ['拉萨市','昌都地区', '山南地区', '日喀则地市', '那曲地区', '阿里地区', '林芝地区' ],
        ['成都市','自贡市', '攀枝花市', '泸州市', '德阳市', '绵阳市', '广元市', '遂宁市', '内江市', '乐山市', '南充市', '眉山市', '宜宾市', '广安市', '达州市', '雅安市', '巴中市', '资阳市', '阿坝藏族羌族自治州', '甘孜藏族自治州', '凉山彝族自治州'],
        ['银川市','石嘴山市','吴忠市','固原市','中卫市'],
        ['海口市','三亚市','五指山市', '琼海市', '儋州市', '文昌市', '万宁市', '东方市', '定安县', '屯昌县', '澄迈县', '临高县', '白沙黎族自治县', '昌江黎族自治县', '乐东黎族自治县', '陵水黎族自治县', '保亭黎族苗族自治县', '琼中黎族苗族自治县' ],
        ['台北市', '高雄市', '基隆市', '台中市', '台南市', '新竹市', '嘉义市'],
        ['中西区', '湾仔区', '东区', '南区', '油尖旺区', '深水埗区', '九龙城区', '黄大仙区', '观塘区', '荃湾区', '葵青区', '沙田区', '西贡区', '大埔区', '北区', '元朗区', '屯门区', '离岛区' ],
        ['澳门']
    ];
    window.onload=function(){//当页面加载完成执行  html css js
        var sheng=document.getElementById('sheng');
        for(var i=0;i<pre.length;i++){
            var option=document.createElement('option');
            option.innerHTML=pre[i];
            option.setAttribute('value',i+','+pre[i]);
            sheng.appendChild(option);
        }
    };
    
    
    
    function addCutty(e2){ 
   		var sheng = $(e2).val().split(",");
   		console.log(sheng[1]);
        var shi=document.getElementById('shi');
        while(shi.children.length>=1){//只要子元素的个数大于1 就移除掉
            shi.removeChild(shi.lastElementChild);//从后往前删
        }
        //var num = $(e2).val();
        var arr=citys[sheng[0]];//根据传值  获取二维数组中的子数组
        for(var i=0;i<arr.length;i++){
            var option=document.createElement('option');
            option.innerHTML=arr[i];
            option.setAttribute('value',arr[i]);
            shi.appendChild(option);
        }
          //$("#sheng").val(sheng[1]);
        // $("#sheng").val(citys[num]);
    }

    $(function(){
        $(".age").click(function(){
            var obj;
            obj=document.getElementById("show-actions2");
            $(".mask").fadeIn();
            $(".btmBox02").slideDown();
            $(".age23").click(function(){
                obj.innerHTML=$(this).text();
                $(".mask").fadeOut();
                $(".btmBox02").slideUp();
            });
            
            $(".age24").click(function(){
                obj.innerHTML=$(this).text();
                $(".mask").fadeOut();
                $(".btmBox02").slideUp();
            });
            
            $(".age25").click(function(){
                obj.innerHTML=$(this).text();
                $(".mask").fadeOut();
                $(".btmBox02").slideUp();
            });
            
            $(".wancheng").click(function(){
                $(".mask").fadeOut();
                $(".btmBox02").slideUp();
            });

        })
    });
    $(function(){
        $(".sex").click(function(){
            var obj;
            obj=document.getElementById("show-actions1");
            $(".mask").fadeIn();
            $(".btmBox").slideDown();
            $(".man").click(function(){
                obj.innerHTML=$(this).text();
                $(".mask").fadeOut();
                $(".btmBox").slideUp();
            });
            $(".woman").click(function(){
                obj.innerHTML=$(this).text();
                $(".mask").fadeOut();
                $(".btmBox").slideUp();
            });
            $(".wancheng").click(function(){
                $(".mask").fadeOut();
                $(".btmBox").slideUp();
            });

        })
    })
    
    //标签
    $(function(){
            $(".biaoQ>a").click(function(){
                var obj;
                obj=document.getElementById("show-actions1");
                $(".mask").fadeIn();
                $(".weui-cells1").slideDown();
                $("#xiala1").click(function(){
                    $(this).css("background-color","#42e264");
                    $(this).siblings().css("background-color","#fff");
                    $("#quxiao").css("color","#000");
                    obj.innerHTML=$(this).children().text();
                    $(".mask").fadeOut();
                    $(".weui-cells1").slideUp();
                    $("#types").val($(".type").text());
                });
                $("#xiala2").click(function(){
                    $(this).css("background-color","#42e264");
                    $(this).siblings().css("background-color","#fff");
                    $("#quxiao").css("color","#000");
                    obj.innerHTML=$(this).children().text();
                    $(".mask").fadeOut();
                    $(".weui-cells1").slideUp();
                     $("#types").val($(".type").text());
                });
                $("#xiala3").click(function(){
                    $(this).css("background-color","#42e264");
                    $(this).siblings().css("background-color","#fff");
                    $("#quxiao").css("color","#000");
                    obj.innerHTML=$(this).children().text();
                    $(".mask").fadeOut();
                    $(".weui-cells1").slideUp();
                     $("#types").val($(".type").text());
                });

                $(".cancel1").click(function(){
                    $("#quxiao").css("background-color","#42e264");
                    $("#quxiao").siblings().css("background-color","#fff");
                    $("#quxiao").css("color","#000");
                    $(".mask").fadeOut();
                    $(".weui-cells1").slideUp();
                })
            })
        });
</script>
</body>
</html>