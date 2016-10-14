# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

monthly_budget = -> 
  annual_income = $('#wardrobe_annual_income').val()
  family_size = $('#wardrobe_family_size').val()
  Math.trunc(annual_income / family_size / 12 * .028)

display_style_description = ->
  style_id = $('#wardrobe_style_id').children(":selected").attr("value");
  $.ajax
    type: 'GET'
    url: '/styles/' + style_id

    success: (data) ->
      $('#style_description').text(data.description);

      # If I want to preview the wardrobe items here is how to access the data
      #
      # $("ideal-wardrobe").empty();
      # for item in data.items
      #   console.log item.name
      #   $('#ideal-wardrobe').append($('<li>').text(item.name));

      return


$(document).on "turbolinks:load", ->

  display_style_description()

  $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_family_size').on 'change', ->
    $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_annual_income').on 'change', ->
    $('#wardrobe_monthly_budget').text(monthly_budget);

  $('#wardrobe_style_id').on 'change', ->
    display_style_description()