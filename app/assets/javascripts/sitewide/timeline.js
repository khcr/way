$(document).ready(function(){
  $(".b").hoverIntent(function() {
  	var className = '.' + $(this).attr('class').split(' ')[0] + 'a';
  	$('.a').stop(true, true).fadeTo('fast', 0.5);
  	$(className).stop(true, true).fadeTo(10, 1);
  	var left = $(this).position().left + 50;
  	//$('#informations').css("top", $(this).position().top + "px");
  	//$('#informations').css("left", left + "px");
  	//$('#informations').stop(true, true).slideToggle('normal');
  },
  function() {
    $('.a').fadeTo('fast', 1);
    //$('#informations').slideToggle('normal');
  });

/*
  $('.1a, .1').click(function(){
   $(".d").toggle('normal');
  });
  $(".e").click(function(){
   $(".f").toggle('normal');
  });

  $('#to_popup').click( function() {
      $(this).bPopup({
          modalClose: true
          });
      });
  */
  $(".toggle_trigger, .toggle_now").click(function() {
    $(this).parent().nextAll('.toggle_wrap').first().toggle('slow');
  });
  $(".toggle_now").toggle(2000);
});