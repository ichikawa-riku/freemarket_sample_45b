$(document).on('turbolinks:load', function(){

  function addClassActive(targetElement){
    var targetClass = $(targetElement).attr("class")
    switch(targetClass){
      case "main-category__link" : $(targetElement).addClass("main-category__link--active"); break;
      case "sub-category__link" : $(targetElement).addClass("sub-category__link--active"); break;
      case "category__link" : $(targetElement).addClass("category__link--active"); break;
    }
  };

  function removeClassActive(targetElement){
    var targetClass = $(targetElement).attr("class").split(" ")[0]
    switch(targetClass){
      case "main-category__link" : $(targetElement).removeClass("main-category__link--active"); break;
      case "sub-category__link" : $(targetElement).removeClass("sub-category__link--active"); break;
      case "category__link" : $(targetElement).removeClass("category__link--active"); break;
    }
  };

  function ajax(url, targetNum, thisElement){
    $.ajax({
      type: 'GET',
      url: url,
      data: { id: targetNum },
      dataType: 'json'
    })
    .done(function(categories) {
      var htmlUl = buildUlHtml(targetNum, thisElement);
      $(".category-list-box").append(htmlUl)
      var targetId = createTargetId(targetNum, thisElement)
      createLi(categories, thisElement, targetId);
    })
  }

  function buildUlHtml(targetNum, targetElement){
    var thisClass = $(targetElement).attr("class").split(" ")[0]
    if (thisClass === "main-category__link"){
      htmlUl = `<ul class="sub-category-lists" id= "sub-category-ul-main-category-${targetNum}" ></ul>`
    } else if (thisClass === "sub-category__link"){
      htmlUl = `<ul class="category-lists" id= "category-ul-sub-category-${targetNum}" ></ul>`
    }
    return htmlUl
  }

  function createTargetId(targetNum,targetElement){
    var thisClass = $(targetElement).attr("class").split(" ")[0]
    if (thisClass === "main-category__link"){
      var targetId = "sub-category-ul-main-category-" + targetNum
    }
    else if (thisClass === "sub-category__link"){
      var targetId = "category-ul-sub-category-" + targetNum
    }
    return targetId
  }

  function createLi(categories,targetElement,targetId){
    var thisClass = $(targetElement).attr("class").split(" ")[0]
    if (thisClass === "main-category__link"){
      var type = "sub-category"
    }
    else if (thisClass === "sub-category__link"){
      var type = "category"
    }
    $.each(categories,function(index, category){
      htmlLi = `<li class="${type}" id="${type}-${category.id}">
                <a class="${type}__link" id="${type}-link-${category.id}" href="/categories/${category.id}">${category.name}</a>
              </li>`
      $("#" + targetId).append(htmlLi);
    })
  }

  $("body").on("mouseover", "#category-find-btn", function(){
    $(".category-list-box").removeClass("category-list-box-hidden")
  })

  $(".main-category__link").hover(
    function(){
      if($(".sub-category-lists").length > 0){
        $(".sub-category-lists").remove();
      }
      addClassActive(this);
      var targetNum = $(this).attr("href").replace(/[^0-9]/g, '')
      var url = '/categories/sub_category'
      ajax(url, targetNum, this)
    },
    function(){
      removeClassActive(this);
      var targetNum = $(this).attr("href").replace(/[^0-9]/g, '')
      var targetId = "sub-category-ul-main-category-" + targetNum
    }
  );
  $("body").on({
    'mouseenter' : function(){
      if($(".category-lists").length > 0){
        $(".category-lists").remove();
      }
      addClassActive(this);
      var targetNum = $(this).attr("href").replace(/[^0-9]/g, '')
      var url = '/categories/category'
      ajax(url, targetNum, this)
    },
    'mouseleave' : function(){
      removeClassActive(this);
    }},
    ".sub-category__link"
  );
  $("body").on({
    'mouseenter' : function(){
      var subCategoryId = $(this).parent().parent().attr("id").replace(/[^0-9]/g, '')
      var subCategoryLinkId = "sub-category-link-" + subCategoryId
      var subCategorylink = $("#" + subCategoryLinkId)
      var mainCategoryId = $(subCategorylink).parent().parent().attr("id").replace(/[^0-9]/g, '')
      var mainCategoryLinkId = "main-category-link-" + mainCategoryId
      var mainCategorylink = $("#" + mainCategoryLinkId)
      addClassActive(mainCategorylink)
      addClassActive(subCategorylink);
      addClassActive(this);
    },
    'mouseleave' : function(){
      removeClassActive(this);
    }},
    ".category__link"
  );

  $("body").on({
    'mouseenter' : function(){
      $(".category-list-box").css('width', '500px');
      if ($(".category-lists").length > 0){
        $(".category-lists").remove();
      $(".category-list-box").css('width', '500px');
      }
    },
    'mouseleave' : function(){

    }},
    ".main-category-lists"
  );

  $("body").on({
    'mouseenter' : function(){
      var thisId = $(this).attr("id").replace(/[^0-9]/g, '')
      var mainCategoryLinkId = "main-category-link-" + thisId
      var mainCategorylink = $("#" + mainCategoryLinkId)
      addClassActive(mainCategorylink);
      $(".category-list-box").css('width', '750px');
    },
    'mouseleave' : function(){
      var thisId = $(this).attr("id").replace(/[^0-9]/g, '')
      var mainCategoryLinkId = "main-category-link-" + thisId
      var mainCategorylink = $("#" + mainCategoryLinkId)
      removeClassActive(mainCategorylink);
    }},
    ".sub-category-lists"
  );

  $("body").on({
    'mouseenter' : function(){
      var thisId = $(this).attr("id").replace(/[^0-9]/g, '')
      var subCategoryLinkId = "sub-category-link-" + thisId
      var subCategorylink = $("#" + subCategoryLinkId)
      var mainCategoryId = $(subCategorylink).parent().parent().attr("id").replace(/[^0-9]/g, '')
      var mainCategoryLinkId = "main-category-link-" + mainCategoryId
      var mainCategorylink = $("#" + mainCategoryLinkId)
      addClassActive(mainCategorylink)
      addClassActive(subCategorylink);
    },
    'mouseleave' : function(){
      var thisId = $(this).attr("id").replace(/[^0-9]/g, '')
      var subCategoryLinkId = "sub-category-link-" + thisId
      var subCategorylink = $("#" + subCategoryLinkId)
      var mainCategoryId = $(subCategorylink).parent().parent().attr("id").replace(/[^0-9]/g, '')
      var mainCategoryLinkId = "main-category-link-" + mainCategoryId
      var mainCategorylink = $("#" + mainCategoryLinkId)
      removeClassActive(mainCategorylink)
      removeClassActive(subCategorylink);
    }},
    ".category-lists"
  );

  $("body").on("mouseleave", ".category-list-box", function(){
    $(".category-list-box").addClass("category-list-box-hidden");
    if($(".category-lists").length > 0){
      $(".category-lists").remove();
    }
    if($(".sub-category-lists").length > 0){
      $(".sub-category-lists").remove();
    }
      $(".category-list-box").css('width', '250px');
  });
});

