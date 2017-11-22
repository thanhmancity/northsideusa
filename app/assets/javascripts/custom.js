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

  var sizesSlider = $('#sizesSlider').freshslider({
      step: 0.5,
      range: false,
      min: parseFloat($('#sizesSlider').attr('data-min-size')),
      max: parseFloat($('#sizesSlider').attr('data-max-size')),
      value: parseFloat($('#sizesSlider').attr('data-min-size'))
  });

  var priceSlider = $('#priceSlider').freshslider({
    range: true,
    unit:'$',
    step: 0.1,
    min: Math.floor(parseFloat($('#priceSlider').attr('data-min-size'))),
    max: parseFloat($('#priceSlider').attr('data-max-size')),
    value: [Math.floor(parseFloat($('#priceSlider').attr('data-min-size'))), Math.floor(parseFloat($('#priceSlider').attr('data-min-size')))],
    onchange:function(low, high){
      $('#priceSlider input').val([low + '..' + high]);
    }
  });


  $('#priceSlider').on('mouseup','.fscaret', function(){
    var url = '/men/trail';
    var min_price = parseFloat($('#priceSlider .fscaret').prev().text());
    var max_price = parseFloat($('#priceSlider .fscaret').next().text());
    $.ajax({
    url: url,
      dataType: 'jsonp',
      type: 'GET',
      data: {min_price: min_price, max_price: max_price, filter_type: 'price'}
    });
  });

  $('#sizesSlider').on('mouseup','.fscaret', function(){
    var url = '/men/trail';
    var size = parseFloat($('#sizesSlider .fscaret').text());
    $.ajax({
    url: url,
      dataType: 'jsonp',
      type: 'GET',
      data: {size: size, filter_type: 'size'}
    });
  });
});
