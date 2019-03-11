$(function(){
  var form = $('#add-card');

  $('#add-card').on("submit", function(e){
    e.preventDefault();
    Payjp.setPublicKey('pk_test_db731d8714c8a40ebc1793b4');
    form.find("button").prop("disabled", true)
    var card = {
      number : parseInt($('#payment_card_no').val()),
      cvc : parseInt($('#security_code').val()),
      exp_month : parseInt($('#payment_card_expire_mm').val()),
      exp_year : parseInt($('#payment_card_expire_yy').val())
    };
    console.log(card);
    Payjp.createToken(card, function(status, response){
      if (status === 200) {
        $('.form-group-card-num__input').removeAttr("name");
        $('.form-group-card-expire__input').removeAttr("name");
        $('.form-group-card-expire__input').removeAttr("name");
        $('.form-group-card-num__input').removeAttr("name");
        var token = response.id;
        console.log(token);
        form.append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        form.get(0).submit();
      }
      else {
        alert('error');
        form.find('button').prop('disabled', false);
      }
    });
  });
});