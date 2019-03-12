$(document).on('turbolinks:load', function(){
  $('.form-group-card-code__explain').on('click', function(){
    $('#securityCode-modal').fadeIn(200);
  });
  $(document).on('click', function(e){
    if (!$(e.target).closest('.form-group-card-code__explain').length){
      $('#securityCode-modal').fadeOut();
    }
  });
});
  

