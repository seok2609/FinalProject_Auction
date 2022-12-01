//api authURL : URL을 상수로 선언. 보통은 properies에 선언하여 사용함
let apiURL = 'https://at.agromarket.kr/openApi/price/sale.do';

//api authKey : 인증키를 상수로 선언. 보통은 properies에 선언하여 사용함
let apiKey = '9596499878664F83A1D560AE3808376E';

// //$(document).ready()는 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라.
// $(document).ready(function(){      
// 	var api = new Vue ({
// 		el : "#api",
// 		data : {
// 			apiList : [], // api를 통해 가져온 json 데이터를 담아서 화면에 뿌려주도록 함
// 			pageNo : '', // api의 필수 파라메터 값 1
// 			whsalCd : '', //api의 필수 파라메터 값 2
// 			saleDate : '', 
//          largeCd : '' // 대분류 유형 파라메터
// 		},
// 		mounted(){
// 			this.pageNo = '1', // mounted되었을 때 페이지번호 초기값 설정 
// 			this.whsalCd = '5', // mounted되었을 때 한페이지에 표시할 행 초기값 설정
//             this.saleDate = '20221122',
// 			this.search(); // mounted되었을 때 search 함수를 호출해 api를 호출함
// 		},
// 		methods : {
// 			search : function(){
// 				var self = this;
// 				var config = {headers: {"Accept": "*/*",}}; // header를 변수로 선언
// 				/*
// 				 * url를 선언함. 여기서는 그냥 대충 짰지만, 실제 사용할 때는 URL작성이 조금 더 동적이면서 유연하게 작성 할 필요가 있음
// 				 * */
// 				var url = apiURL + '?serviceKey=' +apiKey + '&apiType=json&pageNo=' + this.pageNo + '&whsalCd=' + this.whsalCd + '&saleDate=' + this.saleDate 
//                 + '&largeCd=' + this.largeCd;
// 				axios.get(url,'',config).then(function(reult) { // url호출 -> 공공데이터포털로 데이터 요청을 보낸다. (request)
// 					self.apiList = result.data.items; // 서버통신 성공시 apiList 배열에 해당 값을 담음 ( response )
// 				})
// 			},
// 		}
// 	});
//  })


// $("#aj").click(function(){

//     let pageNo = 1;
//     let whsalCd =110001;
//     let saleDate = 20221122;
//     let  largeCd = 06;
//    let url1 = 'https://cors-anywhere.herokuapp.com/'+apiURL + '?serviceKey=' +apiKey + '&apiType=json&pageNo=' + pageNo + '&whsalCd=' + whsalCd + '&saleDate=' + saleDate 
//     + '&largeCd=' + largeCd;
//     console.log(url1);
//     $.ajax({
//         url : 'https://cors-anywhere.herokuapp.com/'+apiURL + '?serviceKey=' +apiKey + '&apiType=json&pageNo=' + pageNo + '&whsalCd=' + whsalCd + '&saleDate=' + saleDate 
//         ,
//         traditional:true,
//         data : {
//                 pageNo : '1', // api의 필수 파라메터 값 1
//                 whsalCd : '110001', //api의 필수 파라메터 값 2
//                 saleDate : '20221122', 
//                 largeCd : '06' // 대분류 유형 파라메터
//         },
//         success : function(data) {
           
//          },
//         error : function() {
//             alert("error");
          
//         }
//     });

// });

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
   let url = 'https://cors-anywhere.herokuapp.com/'+apiURL + '?serviceKey=' +apiKey + '&apiType=json&pageNo=' + pageNo + '&whsalCd=' + whsalCd + '&saleDate=' + saleDate;
        $.ajax({
        type:"get",
        url: url,
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
            str = '<TR>'; 
                $.each(jsonData.data , function(i){
                    str += '<TD>' + jsonData.data[i].saleDate + '</TD>'+
                           '<TD>' + jsonData.data[i].whsalName + '</TD>'+
                            '<TD>' + jsonData.data[i].cmpName + '</TD>'+
                           '<TD>' + jsonData.data[i].smallName + '</TD>';
                    str += '</TR>';
                });
            $('.table_body').append(str);
           
        },
        error:function(){
            console.log("통신에러");
        }
    })
}


