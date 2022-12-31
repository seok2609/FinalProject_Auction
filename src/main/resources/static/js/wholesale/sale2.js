//js에서 json요청하여 ajax로 받아오기 test
//api authURL : URL을 상수로 선언. 보통은 properies에 선언하여 사용함
let apiURL = 'https://at.agromarket.kr/openApi/price/sale.do';

//페이징 js에서 하는 이유 - 데이터를 js에서 가공하고 페이지이동없이 ajax로 처리하기 위함 
//json 호출하기 
//https://cors-anywhere.herokuapp.com/ 크로스 에러 떠서 프록시서버 설정 추가

function getJSON(i) {
    let pageNo = 1;
    let perPage = 10;
    let whsalCd = $("#whsalCd").val();
    let saleDate = $("#saleDate").val();
    let largeCd = $("#largeCd").val();
    console.log("pram=="+whsalCd);
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
            let totPage = parseInt(jsonData.totCnt/10)+1 //총페이지수
            let setSmallPage = jsonData.dataCnt/10 //페이지 당 뷰 수. 리스트 10개씩 뽑아올때 1Page당 몇 뷰가 생기는지. 
            alert("미~~~~워~~~~~")
            if(jsonData.dataCnt%10>0){ //나머지값이 있다면 뷰 추가
                setSmallPage++
            }
            if(i<1){
                i =1;
            }
            let startRow =(i-1)*perPage;;
            let lastRow = i*perPage;
            let pagings = '';
            for(let i=1; i<setSmallPage; i++){
                pagings += '<button type="button" onclick="getJSON('+i+')">'+i+'</button>';
        
            }

           
            console.log("통신성공");
            console.log(jsonData);
            console.log("cnt=="+jsonData.totCnt);//총데이터건수
            console.log("cnt=="+jsonData.dataCnt);//페이지데이터건수
            console.log("url=="+url);//요청 url
            console.log(totPage);
            console.log("setSmallpage ="+setSmallPage);
            console.log("startRow ="+startRow);
            console.log("lastRow ="+lastRow);
            console.log("jsonData.data[2].saleDate"+jsonData.data[2].saleDate);

            $('.table_body').empty();
            $('.plsPage').empty();
            $('.paging').empty();
                

            str = '<TR>'; 
            for(let j=startRow; j<lastRow+1; j++){
             str += '<TD>' + jsonData.data[j].saleDate + '</TD>'+
                '<TD>' + jsonData.data[j].whsalName + '</TD>'+
                '<TD>' + jsonData.data[j].cmpName + '</TD>'+
                '<TD>' + jsonData.data[j].smallName + '</TD>';
             str += '</TR>';
             }

                // $.each(jsonData.data , function(i){
                //     str += '<TD>' + jsonData.data[i].saleDate + '</TD>'+
                //            '<TD>' + jsonData.data[i].whsalName + '</TD>'+
                //             '<TD>' + jsonData.data[i].cmpName + '</TD>'+
                //            '<TD>' + jsonData.data[i].smallName + '</TD>';
                //     str += '</TR>';
                // });


            $('.table_body').append(str);
            $('.plsPage').append('<h3>총페이지수:'+totPage+'</h3>');
            $('.paging').append(pagings);
           
        },
        error:function(){
            console.log("통신에러");
        }
    })
}

