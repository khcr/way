$(function() {
  $('.url_link').click(function(){
    prompt("Ctrl/Cmd + C pour copier", $(this).data('url'));
  });
});