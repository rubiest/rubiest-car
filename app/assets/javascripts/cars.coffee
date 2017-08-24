jQuery ->
  # $('#car_model_id').parent().parent().hide()
  models = $('#car_model_id').html()
  $('#car_brand_id').change ->
    brand = $('#car_brand_id :selected').text()
    escaped_brand = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(models).filter("optgroup[label='#{escaped_brand}']").html()
    if options
      $('#car_model_id').html(options)
      $('#car_model_id').parent().parent().show()
    else
      $('#car_model_id').empty()
      $('#car_model_id').parent().parent().hide()
