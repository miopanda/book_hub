$(function($) {
  $("#close-btn").on("click", function(){
    $("#confirmation-dialog").hide();
  });
});

$(function($) {
  var dueDate = new Date();
  dueDate.setDate(dueDate.getDate() + 14); // 今日の日付から2週間後の日付を計算
  var year = dueDate.getFullYear();
  var month = ("0" + (dueDate.getMonth() + 1)).slice(-2);
  var day = ("0" + dueDate.getDate()).slice(-2);
  var formattedDate = year + "-" + month + "-" + day;
  $("#due-date").text(formattedDate);

  $("#lend-btn").on("click", function() {
    $("#confirmation-dialog").fadeIn();
  });

  $("form").on("submit", function(event) {
    $("#hidden-due-date").val(formattedDate); 
    return true;
  });
});
