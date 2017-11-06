var demo = angular.module("demo", ["RongWebIMWidget"]);
var $token="";

demo.controller("main", ["$scope", "WebIMWidget", "$http", function($scope, WebIMWidget, $http) {

    $scope.targetType = 1; //1：私聊 更多会话类型查看http://www.rongcloud.cn/docs/api/js/global.html#ConversationType
    //$scope.targetId = "";//10b3ed81094a44748e021c10c5a52ad5//
    
    //注意实际应用中 appkey 、 token 使用自己从融云服务器注册的。
    $.ajax({
    	type:"post",
    	url:"api/keHuPc/getToken.do",
    	data:{},
    	dataType:"json",
    	async:false,
    	success:function(data){
    		if(data.respCode=="01"){
    			$token=data.token;
    		}
    	}
    })
    var config = {
        appkey: 'k51hidwqk9pxb',
        token: $token,
        displayConversationList: true,
        style:{
            left:3,
            bottom:3,
            width:430
        },
        onSuccess: function(id) {
        	$scope.user = id;
            console.log('连接成功：' + id);
        },
        onError: function(error) {
            console.log('连接失败：' + error);
        }
    };
    RongDemo.common(WebIMWidget, config, $scope);

}]);