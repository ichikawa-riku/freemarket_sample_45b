$(document).on('turbolinks:load', function() {
  const shippingMethodFrom = $("#shipping_method_form")
  const shippingBurdenForm = $("#shipping_burden_form")
  const shippingBurdenFormOptions = $("#shipping_burden_form option")
  const shippingBurdenFormDiv = $("#shipping_burden_form_div")
  const disableTaergetOptions = ["らくらくメルカリ便", "レターパック", "普通郵便(定形、定形外)", "クリックポスト", "ゆうパケット"]

  function appearanceShippingBurden(input) {
    if (input == "送料込み(出品者負担)"){
      shippingBurdenFormDiv.removeClass("hidden")
    }
    else if (input == "着払い(購入者負担)"){
      shippingBurdenFormDiv.removeClass("hidden")
      disableOptions();
    }
    else{
      shippingBurdenFormDiv.addClass("hidden")
    }
  };

  function changeShippingMethodForm(){
    shippingMethodFrom.on("change", function(){
    var shippingMethodFromInput = shippingMethodFrom.val();
    appearanceShippingBurden(shippingMethodFromInput)
    })
  }

  function disableOptions() {
    shippingBurdenFormOptions.each(function(index, option){
      $.each(disableTaergetOptions,function(index, target){
        if ($(option).val() == target){
          $(option).remove();
        }
      })
    })
  }

  changeShippingMethodForm();
});


