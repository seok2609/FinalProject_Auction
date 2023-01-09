let lengthoflist = $("#lengthoflist").val();


for(let i = 1; i<lengthoflist+1 ; i++){
    
let award = $("#award"+i).html();
award += "";
award = award.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
award = "낙찰가 : " + award +"원";

$("#award"+i).html(award);


}