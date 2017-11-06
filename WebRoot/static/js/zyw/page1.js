/**
 * Created by zxm on 2017/3/31.
 */
    function initPage(listCount,currentPage){
        var maxshowpageitem = $(this).attr("maxshowpageitem");
        if(maxshowpageitem!=null&&maxshowpageitem>0&&maxshowpageitem!=""){
            maxshowpageitem = maxshowpageitem;
        }
        var pagelistcount = $(this).attr("pagelistcount");
        if(pagelistcount!=null&&pagelistcount>0&&pagelistcount!=""){
            pagelistcount = pagelistcount;
        }

        if(listCount<0){
            listCount = 0;
        }
        if(currentPage<=0){
            currentPage=1;
        }
       setPageListCount(listCount,currentPage);

    }

    var pageId="page";
    var maxshowpageitem=$("#"+pageId).attr("maxshowpageitem");//最多显示的页码个数
    var pagelistcount=$("#"+pageId).attr("pagelistcount");//每一页显示的内容条数
    /**
     * 初始化分页界面
     * @param listCount 列表总量
     */
    function initWithUl(listCount,currentPage){
        var pageCount = 1;
        if(listCount>=0){
            var pageCount = listCount%pagelistcount>0?parseInt(listCount/pagelistcount)+1:parseInt(listCount/pagelistcount);
        }
        var appendStr = getPageListModel(pageCount,currentPage);
        $("#"+pageId).html(appendStr);
    }
    /**
     * 设置列表总量和当前页码
     * @param listCount 列表总量
     * @param currentPage 当前页码
     */
    function setPageListCount(listCount,currentPage){
        listCount = parseInt(listCount);
        currentPage = parseInt(currentPage);
        initWithUl(listCount,currentPage);
        initPageEvent(listCount);
        //fun(currentPage);
    }
    function initPageEvent(listCount){
        $("#"+pageId +">li[class='pageItem']").on("click",function(){
            setPageListCount(listCount,$(this).attr("page-data"));
        });
    }
    function getPageListModel(pageCount,currentPage){
        var prePage = currentPage-1;
        var nextPage = currentPage+1;
        var prePageClass ="pageItem";
        var nextPageClass = "pageItem";
        if(prePage<=0){
            prePageClass="pageItemDisable";
        }
        if(nextPage>pageCount){
            nextPageClass="pageItemDisable";
        }
        var appendStr ="";
        appendStr+="<li class='"+prePageClass+"' page-data='1' page-rel='firstpage'  onclick='toPage(this,1)'>首页</li>";
        appendStr+="<li class='"+prePageClass+"' page-data='"+prePage+"' page-rel='prepage' onclick='toPage(this,"+prePage+")'>&lt;上一页</li>";
        var miniPageNumber = 1;
        if(currentPage-parseInt(maxshowpageitem/2)>0&&currentPage+parseInt(maxshowpageitem/2)<=pageCount){
            miniPageNumber = currentPage-parseInt(maxshowpageitem/2);
        }else if(currentPage-parseInt(maxshowpageitem/2)>0&&currentPage+parseInt(maxshowpageitem/2)>pageCount){
            miniPageNumber = pageCount-maxshowpageitem+1;
            if(miniPageNumber<=0){
                miniPageNumber=1;
            }
        }
        var showPageNum = parseInt(maxshowpageitem);
        if(pageCount<showPageNum){
            showPageNum = pageCount
        }
        for(var i=0;i<showPageNum;i++){
            var pageNumber = miniPageNumber++;
            var itemPageClass = "pageItem";
            if(pageNumber==currentPage){
                itemPageClass = "pageItemActive";
            }

            appendStr+="<li class='"+itemPageClass+"' page-data='"+pageNumber+"' page-rel='itempage' onclick='toPage(this,"+pageNumber+")'>"+pageNumber+"</li>";
        }
        appendStr+="<li class='"+nextPageClass+"' page-data='"+nextPage+"' page-rel='nextpage' onclick='toPage(this,"+nextPage+")'>下一页&gt;</li>";
        appendStr+="<li class='"+nextPageClass+"' page-data='"+pageCount+"' page-rel='lastpage' onclick='toPage(this,"+pageCount+")'>尾页</li>";
       return appendStr;

    }

