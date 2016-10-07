# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

monthly_budget = -> 
  annual_income = $('#wardrobe_annual_income').val()
  family_size = $('#wardrobe_family_size').val()
  Math.trunc(annual_income / family_size / 12 * .028)

$(document).ready ->

  $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_family_size').on 'change', ->
    $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_annual_income').on 'change', ->
    $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_style_id').on 'change', ->
    style_id = $(this).children(":selected").val();
    $.ajax
      type: 'GET'
      url: '/styles/' + style_id
      # data: style_id
      success: (data) ->
        $('#style_description').text(data.description);
        return