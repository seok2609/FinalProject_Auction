testBtn = document.getElementById("testBtn");
const bar = document.getElementById("progressBar");

console.log("mapTest!");
console.log("disS : ",disS);
console.log("disE : ",disE);
console.log("bar: ",bar.value);
console.log("bar : ", bar.max);


function barValue(){
    bar.value= disE;
    bar.max= disE+disS;
}
