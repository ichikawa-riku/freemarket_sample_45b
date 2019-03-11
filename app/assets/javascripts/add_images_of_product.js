$(document).on('turbolinks:load', function() {
  const imagesLimit = 10

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

  function isCheckedFiles(files){
    var checkedResult = true
    $.each(files, function(i, file) {
      if(file.type.indexOf("image") < 0){
        checkedResult = false
      }
    });
    return checkedResult
  }

  function createThumbnail(file){
    image = file.target.result
    html = `<li class="sell-upload-file">
            <img class="sell-upload-file__image" src="${image}" alt="1000x 1">
            <div class="sell-upload-file__buttons clearfix">
            <a class="sell-upload-file__buttons--button" href="">編集</a>
            <a class="sell-upload-file__buttons--button--delete" href="">削除</a>
            </div>
            </li>`
    $(".sell-upload-files").append(html);
  }

  function createNewForm(thisForm){
    formHtml = `<input class="sell-upload-drop-file" type="file" multiple="multiple"></input>`
    thisForm.hide();
    $(".sell-upload-drop-box").append(formHtml);
  }
  $(document).on("change", ".sell-upload-drop-file", function(){
    var countImages = $(".sell-upload-file").length
    var imageForm = $(".sell-upload-drop-file")
    resetErrorMessage();
    var thisForm = $(this);
    var files = this.files;
    var countInputImages = files.length;
    var sumImages = countImages + countInputImages;
    if (sumImages <= imagesLimit ){
      if ( isCheckedFiles(files) ){
        createNewForm(thisForm);
        $.each(files, function(i, file) {
          var reader = new FileReader();
          reader.onload = (function(file){
            return function(e){
              createThumbnail(e);
            };
          })(file);
          reader.readAsDataURL(file);
        });
      }else{
        createFileErrorMessage();
        thisForm.val("");
      }
    }else{
      countOverErrorMessage();
      thisForm.val("");
    }
  });
});
