# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#tax-button', ->
  debugger
  selected = []
  if($('input:checked').length > 0)
    $.each $('input:checked'), ->
      selected.push $(this).attr("id")
      return
    
    $.ajax
      type: 'GET'
      url: '/items/tax_details.js'
      dataType: 'JSON'
      data: { item_ids: selected }
      success: (data) ->
        $('#tax_details').html(data.content)
    return
  else
    alert("please select atleast one item");
