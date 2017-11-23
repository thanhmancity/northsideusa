$(document).on('ready', function () {
  $(document).on('click','.rootTreeCategory', function(){
    var dataList = $(this).attr('data-list');
    var status = $(this).attr('data-active');
    $('.categoryPlusBtn i').attr('class', 'fa fa-plus');
    $('.categoryFilterBox .categoryItem span').attr('data-active', 'active');
    if(status === 'active'){
      $(this).attr('data-active', 'unActive');
      $(this).children().children().attr('class', 'fa fa-minus');
      $('.navListCategory').fadeOut();
      $('#' + dataList).fadeIn('3000');
    }else{
      $(this).attr('data-active', 'active');
      $(this).children().children().attr('class', 'fa fa-plus');
      $('#' + dataList).fadeOut('3000');
    }
  });

  $(document).on('click', '.radioBtnFilter', function(){
    if($(this).attr('checked') === 'checked'){
      $(this).next().trigger('click');
    }
  });

  $(document).on('click', '.filterLink', function(){
    $(this).prev().attr('checked', 'checked');
  });
});
