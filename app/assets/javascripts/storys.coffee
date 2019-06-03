

$ ->
  $('#myButton').click ->
    $('.card-body').show()
    $('#location-body').hide()
    $('#location-body').removeClass('hidden');

$ ->
  $('#myButton').click (event) ->
    $('html, body').animate { scrollTop: '610px' }, 500
    return

$ ->
  $('#myButton2').click ->
    $('.card-body').hide()
    $('#location-body').show()

$ ->
  $('#myButton2').click (event) ->
    $('html, body').animate { scrollTop: '610px' }, 500
    return

$ ->
  $('#myButton3').click ->
    $('.card-body').show()
    $('#location-body').hide()
    $('#location-body').removeClass('hidden');

$ ->
  $('#myButton3').click (event) ->
    $('html, body').animate { scrollTop: '180px' }, 500
    return

$ ->
  $('#myButton4').click ->
    $('.card-body').hide()
    $('#location-body').show()

$ ->
  $('#myButton4').click (event) ->
    $('html, body').animate { scrollTop: '180px' }, 500
    return

$ ->
  $('#SidebarButton1').click ->
    $('.card-body').show()
    $('#location-body').hide()
    $('#location-body').removeClass('hidden');

$ ->
  $('#SidebarButton1').click (event) ->
    $('html, body').animate { scrollTop: '410px' }, 500
    return

$ ->
  $('#SidebarButton2').click ->
    $('.card-body').hide()
    $('#location-body').show()

$ ->
  $('#SidebarButton2').click (event) ->
    $('html, body').animate { scrollTop: '410px' }, 500
    return

$ ->
  $('#xsbtn').click ->
    $('.card-body').show()
    $('#location-body').hide()
    $('#location-body').removeClass('hidden');

$ ->
  $('#xsbtn').click (event) ->
    $('html, body').animate { scrollTop: '610px' }, 500
    return

$(window).scroll ->
  if $(this).scrollTop() > 600
    $('#xsbtn').show 600
  else
    $('#xsbtn').hide 600
  return

$ ->
  $('#xsbtn2').click ->
    $('.card-body').hide()
    $('#location-body').show()

$ ->
  $('#xsbtn2').click (event) ->
    $('html, body').animate { scrollTop: '610px' }, 500
    return

$(window).scroll ->
  if $(this).scrollTop() > 600
    $('#xsbtn2').show 600
  else
    $('#xsbtn2').hide 600
  return



$(window).scroll ->
  if $(this).scrollTop() > 380
    $('#SidebarButton1').show 550

  else
    $('#SidebarButton1').hide 550
    $('#SidebarButton1').removeClass('hidden');
  return

$(window).scroll ->
  if $(this).scrollTop() > 380
    $('#SidebarButton2').show 600
  else
    $('#SidebarButton2').hide 600
  return


updateProgress = (num1, num2) ->
  percent = Math.ceil(num1 / num2 * 100) + '%'
  document.getElementById('progress').style.width = percent
  return

window.addEventListener 'scroll', ->
  top = window.scrollY
  height = document.body.getBoundingClientRect().height - (window.innerHeight)
  updateProgress top, height
  return


$(document).on 'turbolinks:load', ->
  $('#BackToTop').click (event) ->
    $('html, body').animate { scrollTop: '1px' }, 500
    return

$(document).on 'turbolinks:load', ->
  $('input[type="checkbox"]').click ->
    $('.PermalinkOverlay').fadeToggle()
    $('body').toggleClass 'stop-scrolling'
    return

$(document).on 'turbolinks:load', ->
  $('#searchbtn').click ->
    $('.PermalinkOverlay').fadeToggle() 
    $('#search').toggle() 
    $('body').toggleClass 'stop-scrolling'
    return

$('#searchbtn').click ->
  if $('input[type="checkbox"]').attr 'disabled', true
  else
     $('input[type="checkbox"]').removeAttr 'disabled'
  return

(($) ->

  $.fn.toggleDisabled = ->
    @each ->
      $this = $(this)
      if $this.attr('disabled')
        $this.removeAttr 'disabled'
      else
        $this.attr 'disabled', 'disabled'
      return

  return
) jQuery
$(document).on 'turbolinks:load', ->
  $('#searchbtn').click ->
    $('input[type="checkbox"]').toggleDisabled()
    $('.search').toggleClass("white")
    return
  return

