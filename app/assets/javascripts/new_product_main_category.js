$(document).on('turbolinks:load', function() {
  const mainCategoryForm = $("#main_category_form")
  const subCategoryForm = $("#sub_category_form")
  const categoryForm = $("#category_form")
  const subCategoryUrl= "/categories/sub_category"
  const categaoryUrl = "/categories/category"

  function emptyCategoryForm(target){
    target.empty();
  }

  function appendCategoryFirstOptions(target){
    var html = `<option value="">---</option>`
    target.append(html);
  }

  function appendCategoryOptions(target, categories){
    $.each(categories,function(index, category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      target.append(html);
    })
  }

  function removeClassCategoryForm(target){
    target.removeClass("hidden")
  }

  function addClassCategoryForm(target){
    target.addClass("hidden")
  }

  function selectedCategoryFormMain(target, target2, url){
    target.on("change",function(){
      var targetInput = target.val();
      if (targetInput != ""){
        $.ajax({
          type: 'GET',
          url: url,
          data: { id: targetInput },
          dataType: 'json'
        })
        .done(function(data) {
          removeClassCategoryForm(target2);
          emptyCategoryForm(target2);
          appendCategoryFirstOptions(target2);
          appendCategoryOptions(target2, data);
        })
      }else{
        if (target == mainCategoryForm){
          if (categoryForm.hasClass("hidden")){
            addClassCategoryForm(target2)
            emptyCategoryForm(target2);
          }else{
            addClassCategoryForm(target2)
            emptyCategoryForm(target2);
            addClassCategoryForm(categoryForm);
            emptyCategoryForm(categoryForm);
          }
        }else{
          addClassCategoryForm(target2);
          emptyCategoryForm(target2);
        }
      }
    });
  }
  selectedCategoryFormMain(mainCategoryForm, subCategoryForm, subCategoryUrl)
  selectedCategoryFormMain(subCategoryForm, categoryForm, categaoryUrl)
});
