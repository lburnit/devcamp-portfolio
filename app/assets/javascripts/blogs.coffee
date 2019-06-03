$ ->
  $('#BackToTop').click (event) ->
    $('html, body').animate { scrollTop: '1px' }, 500
    return

$(window).scroll ->
  if $(this).scrollTop() > 380
    $('#SidebarButton3').show 550

  else
    $('#SidebarButton3').hide 550
    $('#SidebarButton3').removeClass('hidden');
  return

$(window).scroll ->
  if $(this).scrollTop() > 380
    $('#SidebarButton4').show 550

  else
    $('#SidebarButton4').hide 550
    $('#SidebarButton4').removeClass('hidden');
  return

$(window).scroll ->
  if $(this).scrollTop() > 380
    $('#SidebarButton5').show 550

  else
    $('#SidebarButton5').hide 550
    $('#SidebarButton5').removeClass('hidden');
  return

$ ->
  $('.flat-button').click ->
    $('#flat-button-wellbeing').show;
    $('#flat-button-wellbeing').removeClass('hidden');
    return
