$(document).on('ready', function () {
  $(document).on('click','.rootTreeCategory', function(){
    var dataList = $(this).attr('data-list');
    var status = $(this).attr('data-active');
    if(status === 'active'){
      $(this).attr('data-active', 'unActive');
      $(this).children('span').css('background-color', '#686868');
      $('#' + dataList).fadeIn('3000');
    }else{
      $(this).attr('data-active', 'active');
      $(this).children('span').css('background-color', '#393B38');
      $('#' + dataList).fadeOut('3000');
    }
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
