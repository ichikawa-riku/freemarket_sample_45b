$(document).on('turbolinks:load', function() {
  const imagesLimit = 10
  var index = 1
  function resetErrorMessage(){
    if ($(".sell-upload-errors")){
      $(".sell-upload-errors").remove()
    }
  }

  function createFileErrorMessage(){
    var errorHtml = `<div class="sell-upload-errors" >ファイル形式はjpeg、またはpngが使用できます</div>`
    $(".sell-upload-drop-box").after(errorHtml);
  }

  function countOverErrorMessage(){
    var errorHtml = `<div class="sell-upload-errors" >アップロードできる画像は10枚までです。</div>`
    $(".sell-upload-drop-box").after(errorHtml);
  }

  function isImageFile(file){
    var result = file.type.match('image.*')
    return result
  }

  function createThumbnail(file, index){
    image = file.target.result
    html = `<li class="sell-upload-file">
            <img class="sell-upload-file__image" src="${image}" alt="1000x 1">
            <div class="sell-upload-file__buttons clearfix">
            <button class="sell-upload-file__buttons--button">編集</a>
            <button class="sell-upload-file__buttons--button--delete" id="delete-button-${index - 1}" href="">削除</a>
            </div>
            </li>`
    $(".sell-upload-files").append(html);
  }

  function createNewForm(thisForm, index){
    formHtml = `<input class="sell-upload-drop-file image-input-form" type="file" name="product[product_images_attributes][${index}][image]" id="product_product_images_attributes_${index}_image">`
    thisForm.hide();
    $(".sell-upload-drop-box").append(formHtml);
  }

  function removeForm(targetId){
    $("#"+ targetId).remove();
  }

  function removeThumbnail(pushButton){
    pushButton.parent().parent().remove();
  }

  function imeageMain(thisForm, file){
    var countImages = $(".image-input-form").length
    var sumImages = countImages;
    resetErrorMessage();
    if (sumImages <= imagesLimit ){
      if ( isImageFile(file) ){
        createNewForm(thisForm, index);
        var reader = new FileReader();
        reader.onload = (function(file){
          return function(e){
            createThumbnail(e, index);
            index ++
          };
        })(file);
          reader.readAsDataURL(file);
      }else{
        createFileErrorMessage();
        thisForm.val("");
      }
    }else{
      countOverErrorMessage();
      thisForm.val("");
    }
  }

  $(document).on("change", "input[type=file].sell-upload-drop-file", function(){
    var thisForm = $(this);
    var file = this.files[0];
    imeageMain(thisForm, file);
  });

  $(document).on("click", ".sell-upload-file__buttons--button--delete", function(event){
    event.preventDefault();
    var pushButton = $(this)
    var pushButtonId = pushButton.attr('id');
    var targetNumbaer = pushButtonId.replace(/[^0-9]/g, '')
    var targetId = "product_product_images_attributes_"+ targetNumbaer +"_image"
    removeForm(targetId);
    removeThumbnail(pushButton);
  });
});

