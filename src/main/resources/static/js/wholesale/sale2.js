//api authURL : URL을 상수로 선언. 보통은 properies에 선언하여 사용함
let apiURL = 'https://at.agromarket.kr/openApi/price/sale.do';

//페이징 js에서 하는 이유 - 데이터를 js에서 가공하고 페이지이동없이 ajax로 처리하기 위함 
//json 호출하기 
//https://cors-anywhere.herokuapp.com/ 크로스 에러 떠서 프록시서버 설정 추가
function getJSON() {
    let pageNo = 1;
    let whsalCd = $("#whsalCd").val();
    let saleDate = $("#saleDate").val();
    let largeCd = $("#largeCd").val();
    console.log("pram=="+whsalCd);
    // let whsalCd =110001;
    // let saleDate = 20221122;
    // let largeCd = 06;
   let url = 'https://cors-anywhere.herokuapp.com/'+apiURL
        $.ajax({
        type:"get",
        url: url,
        data: {
            serviceKey:'9596499878664F83A1D560AE3808376E',
            apiType:'json',
            pageNo:pageNo,
            whsalCd:whsalCd,
            saleDate:saleDate
        },
        Headers:{
            "Access-Control-Allow-Origin":"*"
        },
        crossOrigin: true,
        dataType:"json",
        success: function(jsonData){
            console.log("통신성공");
            console.log(jsonData);

            console.log("cnt=="+jsonData.totCnt);
            console.log("url=="+url);
            //몫을 정수로 변환
            let totPage = parseInt(jsonData.totCnt/10)+1
            console.log(totPage);
            $('.table_body').empty();
          //  $('.plsPage').empty();
            str = '<TR>'; 
                $.each(jsonData.data , function(i){
                    str += '<TD>' + jsonData.data[i].saleDate + '</TD>'+
                           '<TD>' + jsonData.data[i].whsalName + '</TD>'+
                            '<TD>' + jsonData.data[i].cmpName + '</TD>'+
                           '<TD>' + jsonData.data[i].smallName + '</TD>';
                    str += '</TR>';
                });
            $('.table_body').append(str);
          //  $('.plsPage').append('<h1>'+totPage+'</h1>');
           
        },
        error:function(){
            console.log("통신에러");
        }
    })
}


