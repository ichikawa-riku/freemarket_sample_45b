$(document).on('turbolinks:load',function(){
  const inputForm = $(".sell-price-form")
  const lowerLimitPrice = 300
  const upperLimitPrice = 9999999

  function isPossibleSalePrice(price){
    result = price >= lowerLimitPrice && price <= upperLimitPrice
    return result
  }
  inputForm.on("keyup", function(){
    var inputPrice = inputForm.val();
    if ( isPossibleSalePrice(inputPrice) ){
      var salesFee = Math.floor(inputPrice * 0.1);
      var profit = parseInt(inputPrice) - parseInt(salesFee);
      $(".sales-fee").text(salesFee);
      $(".profit").text(profit);
    }else{
      $(".sales-fee").text("ー");
      $(".profit").text("");
    }
  });
});
