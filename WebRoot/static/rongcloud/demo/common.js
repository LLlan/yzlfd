(function () {
/*
    将相同代码拆出来方便维护
 */
window.RongDemo = {
    common: function (WebIMWidget, config, $scope) {
        WebIMWidget.init(config);

        /*WebIMWidget.setUserInfoProvider(function(targetId, obj) {
            obj.onSuccess({
                name: "用户：" + targetId
            });
        });*/
        
        WebIMWidget.setUserInfoProvider(function(targetId,obj){
        	$.post('api/keHuPc/getData.do',{userId:targetId},function(data){
        		obj.onSuccess({
        			name:data.name,
        			userId:data.userId,
        			portraitUri:data.portraitUri
        		});
        		$scope.name=data.name;
        	})
        });
        
        WebIMWidget.setGroupInfoProvider(function(targetId, obj){
            obj.onSuccess({
                name:'群组：' + targetId
            });
        })

        $scope.setconversation = function (targetId) {
        	$.post('api/keHuPc/getUserId.do',{},function(date){
        		if(date.userId==undefined ||date.userId=="" ){
        			layer.alert("你还没有登录,点击确定去登录!",{
    		            title:"提示"//提示标题，默认为：信息
    		            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    		            ,anim: 0 //动画类型0-6，默认为：0
    		            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
    		            ,btn: ['退出','确定'] //按钮
    		            ,icon: 5    // icon
    		            ,yes:function(){
    		            	layer.closeAll();
    		            }
    		            ,btn2:function(){
    		            	window.location.href="api/keHuPc/toLogin.do";
    		            }
    				});
        		}else{
        			$.post('api/keHuPc/getData.do',{userId:targetId},function(data){
                		WebIMWidget.setConversation(Number(1), targetId, data.name );
                        WebIMWidget.show();
                	})
        		}
        	})
        	
            /*if (!!$scope.targetId) {
                WebIMWidget.setConversation(Number($scope.targetType), $scope.targetId, "用户：" + $scope.targetId );
                WebIMWidget.show();
            }*/
        };

        $scope.customerserviceId = "KEFU145914839332836";
        $scope.setcustomerservice = function () {
            WebIMWidget.setConversation(Number(RongIMLib.ConversationType.CUSTOMER_SERVICE), $scope.customerserviceId);
            WebIMWidget.show();
        }

        $scope.show = function() {
            WebIMWidget.show();
        };

        $scope.hidden = function() {
            WebIMWidget.hidden();
        };

        WebIMWidget.hidden();
        

        // 示例：获取 userinfo.json 中数据，根据 targetId 获取对应用户信息
        // WebIMWidget.setUserInfoProvider(function(targetId,obj){
        //     $http({
        //       url:"/userinfo.json"
        //     }).success(function(rep){
        //       var user;
        //       rep.userlist.forEach(function(item){
        //         if(item.id==targetId){
        //           user=item;
        //         }
        //       })
        //       if(user){
        //         obj.onSuccess({id:user.id,name:user.name,portraitUri:user.portraitUri});
        //       }else{
        //         obj.onSuccess({id:targetId,name:"用户："+targetId});
        //       }
        //     })
        // });

        // 示例：获取 online.json 中数据，根据传入用户 id 数组获取对应在线状态
        // WebIMWidget.setOnlineStatusProvider(function(arr, obj) {
        //     $http({
        //         url: "/online.json"
        //     }).success(function(rep) {
        //         obj.onSuccess(rep.data);
        //     })
        // });
    }
}

})()