// 진행중인 방송이 있는지 판별

$.ajax({
    type:"GET",
    url:"/auction/ing",
    success: function(result){
        if(result.length == 0){
            $("#realtime").click(function(){
                alert("방송시간이 아닙니다. 공지사항을 확인해주세요.")
            })
        }else{
            $("#realtime").click(function(){
                
                result = JSON.parse(result);

                console.log(result);

                let link = "/auction/chat?auction_num="+result

                window.open(link);

            })
        }
    }
})