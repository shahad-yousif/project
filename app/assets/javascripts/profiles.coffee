# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', (e) ->
  $.ajaxSetup beforeSend: (xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
    return
  elems = $('input[type=checkbox][data-toggle^=toggle]')
  elems.bootstrapToggle()
  $('.profile_check').change (e) ->
    $.ajax
      url: 'profiles/' + @id + '/change_status/',
      type: 'post',
      success: (data,textStatus,xhr) ->
        $('#notice').html(data.message)
        setTimeout(clearNotice, 2000)
    return
  return
 clearNotice = ->
   $('#notice').empty()
   return
