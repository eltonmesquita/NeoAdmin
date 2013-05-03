// Add close button UI Dialog
$(document).ready(function(){
    $(".warning, .success").append("<a class='close-btn' href='javascript:void(0);'>X</a>");
});

// Hide UI Dialog
$(document).ready(function(){
  $(".close-btn").click(function(){
    $(".warning, .success").addClass("hide-ui");
  });
});