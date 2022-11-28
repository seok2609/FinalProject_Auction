console.log("map Setting");

const bar = document.getElementById("progressBar");
const nowTime = document.getElementById("nowTime");
const startTime = document.getElementById("startTime");
const endTime = document.getElementById("endTime");
const upTime = document.getElementById("upTime");
const downTime = document.getElementById("downTime");

// console.log("bar : "+bar);
// console.log("bar.value : "+bar.value);
// console.log("endTime : "+endTime);
// console.log("endTime.value : "+endTime.value);
// console.log("endTime.value : "+endTime.textContent);

//----------------------
console.log("Positions : ", positions);
console.log("test", positions[0]);
console.log("test lon", positions[1].latlng.La);
console.log("test la", positions[1].latlng.Ma);
var truckLa;
var truckLo;

truckLaP= (positions[0].latlng.Ma - positions[2].latlng.Ma)/100;
truckLoP= (positions[0].latlng.La - positions[2].latlng.La)/100;
truckLaM= (positions[2].latlng.Ma - positions[0].latlng.Ma)/100;
truckLoM= (positions[2].latlng.La - positions[0].latlng.La)/100;

console.log("la+ :: ", truckLaP);
console.log("lon+ :: ", truckLoP);
console.log("la- :: ", truckLaM);
console.log("lon- :: ", truckLoM);


const testBtn = document.getElementById("testBtn");
testBtn.addEventListener("click", function(){
    console.log("테스트버튼");
    console.log("좌표 확인 : ",positions[1].latlng.Ma);
    console.log("좌표 확인 : ",positions[1].latlng.La);
    
})


upTime.addEventListener("click", function(){
    console.log("++");
    var str = nowTime.textContent;
    var arr = str.split(':');
    console.log(arr[0]);
    
    arr[0]= Number(arr[0])+1;
    console.log("변경 전 : "+arr[0]);
    
    if(arr[0] == 25){
        arr[0] = '00';
    }
    if(1 <= arr[0] && arr[0] <= 9){
        console.log("조건 달성");
        arr[0] = '0'+arr[0];
    }

    console.log("변경 후 : "+arr[0]);

    nowTime.textContent = arr[0]+':00';


    //====================
    const e = endTime.textContent;
    var e2 = e.split(':')
    const s = startTime.textContent;
    var s2 = s.split(':')
    const n = nowTime.textContent;
    var n2 = n.split(':');
    console.log("n2 : "+n2[0]);

    const barV = Number(e2[0]) - Number(s2[0]);
    console.log("barV : "+barV);

    if(s2[0]<=n2[0] && n2[0]<=e2[0]){
        console.log("Number(s2[0]) : "+Number(s2[0]));
        console.log("Number(n2[0]) : "+Number(n2[0]));
        bar.value = (Number(n2[0])-Number(s2[0]))*100/barV;
        console.log("bar.value : "+bar.value);
    }

    console.log("bar.value test :", Math.floor(bar.value));
    console.log("test : ",positions[1].latlng.La);
    positions[1].latlng.La = positions[0].latlng.La + truckLoP*Math.floor(bar.value);
    positions[1].latlng.Ma = positions[0].latlng.Ma + truckLaP*Math.floor(bar.value);

    console.log("1.La : ", positions[1].latlng.Ma);
    console.log("1.Lo : ", positions[1].latlng.La);

});

downTime.addEventListener("click", function(){
    console.log("--");
    var str = nowTime.textContent;
    var arr = str.split(':');
    console.log(arr[0]);
    
    arr[0]= Number(arr[0])-1;
    console.log("변경 전 : "+arr[0]);
    
    if(arr[0] == 00){
        arr[0] = '24';
    }
    if(1 <= arr[0] && arr[0] <= 9){
        console.log("조건 달성");
        arr[0] = '0'+arr[0];
    }

    console.log("변경 후 : "+arr[0]);

    nowTime.textContent = arr[0]+':00';
    
    //====================
    const e = endTime.textContent;
    var e2 = e.split(':')
    const s = startTime.textContent;
    var s2 = s.split(':')
    const n = nowTime.textContent;
    var n2 = n.split(':');
    console.log("n2 : "+n2[0]);
 
    const barV = Number(e2[0]) - Number(s2[0]);
    console.log("barV : "+barV);

    if(s2[0]<=n2[0] && n2[0]<=e2[0]){
        console.log("Number(s2[0]) : "+Number(s2[0]));
        console.log("Number(n2[0]) : "+Number(n2[0]));
        bar.value = (Number(n2[0])-Number(s2[0]))*100/barV;
        console.log("bar.value : "+bar.value);
    }

    console.log("bar.value test :", Math.floor(bar.value));
    console.log("test : ",positions[1].latlng.La);
    positions[1].latlng.La = positions[0].latlng.La + truckLoM*Math.floor(bar.value);
    positions[1].latlng.Ma = positions[0].latlng.Ma + truckLaM*Math.floor(bar.value);

    console.log("1.La : ", positions[1].latlng.Ma);
    console.log("1.Lo : ", positions[1].latlng.La);
});


console.log("bar.value : "+bar.value);

const e = endTime.textContent;
var e2 = e.split(':')
const s = startTime.textContent;
var s2 = s.split(':')
const n = nowTime.textContent;
var n2 = n.split(':');
console.log("n2 : "+n2[0]);

const barV = Number(e2[0]) - Number(s2[0]);
console.log("barV : "+barV);

if(s2[0]<=n2[0] && n2[0]<=e2[0]){
    console.log("Number(s2[0]) : "+Number(s2[0]));
    console.log("Number(n2[0]) : "+Number(n2[0]));
    bar.value = (Number(n2[0])-Number(s2[0]))*100/barV;
    console.log("bar.value : "+bar.value);
}

