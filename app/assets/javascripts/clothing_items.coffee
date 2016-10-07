# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # ------------------------------------------------------
  # pretty-fy the upload field
  # ------------------------------------------------------
  $realInputField = $('#clothing_item_image')

  # drop just the filename in the display field
  $realInputField.change ->
    $('#file-display').val $(@).val().replace(/^.*[\\\/]/, '')

  # trigger the real input field click to bring up the file selection dialog
  $('#upload-btn').click ->
    $realInputField.click()


  $('#datetimepicker1').click ->
    # $('#datetimepicker1').datetimepicker({viewMode: 'years', format: 'MM/YYYY'})
    $('#datetimepicker1').datetimepicker({viewMode: 'years', format: 'MM/YYYY'})

  $('.datepicker').datepicker({format: 'MM/YYYY'})


  $(window).load ->
    if $realInputField?
      $('#file-display').val $realInputField.val().replace(/^.*[\\\/]/, '')
      # $('#datetimepicker1').datetimepicker({viewMode: 'years', format: 'MM/YYYY'})
      $('#datetimepicker1').datetimepicker()