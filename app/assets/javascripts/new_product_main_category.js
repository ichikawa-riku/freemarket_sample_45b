$(document).on('turbolinks:load', function() {
  const mainCategoryForm = $("#main_category_form")
  const subCategoryForm = $("#sub_category_form")

  function emptySubCategoryForm(){
    subCategoryForm.empty();
  }

  function appendSubCategoryFirstOptions(){
    var html = `<option value="">---</option>`
    subCategoryForm.append(html);
  }

  function appendSubCategoryOptions(sub_categories){
    $.each(sub_categories,function(index,sub_category){
      var html = `<option value="${sub_category.id}">${sub_category.name}</option>`;
      subCategoryForm.append(html);
    })
  }

  function removeClassSubCategoryForm(){
    subCategoryForm.removeClass("hidden")
  }

  function addClassSubCategoryForm(){
    subCategoryForm.addClass("hidden")
  }

  mainCategoryForm.on("change",function(){
    var mainCategoryInput = mainCategoryForm.val();
    if (mainCategoryInput != ""){
      $.ajax({
        type: 'GET',
        url: '/categories/sub_category',
        data: { main: mainCategoryInput },
        dataType: 'json'
      })
      .done(function(sub_categories) {
        removeClassSubCategoryForm();
        emptySubCategoryForm();
        appendSubCategoryFirstOptions();
        appendSubCategoryOptions(sub_categories);
      })
    }else{
      emptySubCategoryForm();
      addClassSubCategoryForm();
    }
  });
});
