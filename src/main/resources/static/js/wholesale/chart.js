let b1Name = $("#b1Name").val();
let b2Name = $("#b2Name").val();
let b3Name = $("#b3Name").val();
let b1Cnt = $("#b1Cnt").val();
let b2Cnt = $("#b2Cnt").val();
let b3Cnt = $("#b3Cnt").val();

let w1Name = $("#w1Name").val();
let w2Name = $("#w2Name").val();
let w3Name = $("#w3Name").val();
let w4Name = $("#w4Name").val();
let w5Name = $("#w5Name").val();
let w6Name = $("#w6Name").val();
let w1Cnt = $("#w1Cnt").val();
let w2Cnt = $("#w2Cnt").val();
let w3Cnt = $("#w3Cnt").val();
let w4Cnt = $("#w4Cnt").val();
let w5Cnt = $("#w5Cnt").val();
let w6Cnt = $("#w6Cnt").val();

//============= 도넛 차트====================
        var sum = Number("{{sum}}");
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: [b1Name, b2Name, b3Name],
            datasets: [{
              data: [b1Cnt, b2Cnt, b3Cnt],
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

//============= 막대 차트====================

    const ctx2 = document.getElementById('myChart');

    new Chart(ctx2, {
      type: 'bar',
     
      data: {
        labels: [ w1Name, w2Name, w3Name, w4Name, w5Name],
        datasets: [{
          backgroundColor: ['Red', 'Blue', 'Green', 'Purple', 'Orange'],
          data: [w1Cnt, w2Cnt, w3Cnt, w4Cnt, w5Cnt],
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
