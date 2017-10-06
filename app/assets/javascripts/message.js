$(function(){
  function buildHTML(message){

    var html = `<div class = "main-side__body__message" data-message-id="${message.id}">
                  <div class = "main-side__message-name">
                  ${message.user_name}
                  </div>
                    <div class = "main-side__message-time">
                  ${message.text_time}
                    </div>
                      <div class = "main-side__message-body">
                  ${message.text}
                      </div>
                </div>
                  `
    return html;
  }
  $('.main-side__footer-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
  })
  .done(function(data){
      var html = buildHTML(data);
      $('.main-side__body__message-list').append(html);
      $('.main-side__body').animate ({ scrollTop: $('.main-side__body')[0].scrollHeight }, 'fast');
      $('#message_body').val('');
    })
    .fail(function(data){
      alert('error');
    })
  })


  var interval = setInterval(function() {
  if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      processData: false,
      dataType:'json',
      contentType: false
    })
    .done(function(json) {
      var id = $('.main-side__body__message').last().data('message-id');
      var insertHTML = '';
      json.forEach(function(message) {
        if (message.id > id ) {
           insertHTML += buildHTML(message);
          $('.main-side__body__message-list').append(insertHTML);
        }
      });
    })
    .fail(function(json) {
      alert('自動更新に失敗しました');
    });
  } else {
    clearInterval(interval);
   }} , 5 * 1000 );
});
