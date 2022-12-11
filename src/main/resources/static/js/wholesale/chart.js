//============= 도넛 차트====================
        var sum = Number("{{sum}}");
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["당근", "샘플", "Test"],
            datasets: [{
              data: [sum, 50, 20],
              backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
              hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 0,
          },
          
        });

    //     if (chart) {
	// 	chart.destroy();
	// 	chart = new Chart($('#myPieChart'), data)
	// }else {
	// 	chart = new Chart($('#myPieChart'), data)
	// }
		 
	// $("#js-legend").html(chart.generateLegend());

//============= 막대 차트====================

    const ctx2 = document.getElementById('myChart');

    new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });

//============= 메인에 차트 데이터 받아오기 테스트 ====================


function getJSON(i) {
    let pageNo = 1;
    let perPage = 10;
    let whsalCd = $("#whsalCd").val();
    let saleDate = $("#saleDate").val();
    let largeCd = $("#largeCd").val();
    let today = new Date();
    let yesterday = new Date(today.setDate(today.getDate() - 1));
    console.log("pram=="+whsalCd);
        $.ajax({
        type:"get",
        url: "wholesale/fixData",
        data: {
            serviceKey:'9596499878664F83A1D560AE3808376E',
            apiType:'json',
            pageNo:pageNo,
            whsalCd:"110001",
            saleDateStart:yesterday,
            saleDateEnd:yesterday
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