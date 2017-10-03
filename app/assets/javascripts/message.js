$(function(){
  function buildHTML(comment){
     console.log(comment);
    var html = `<div class = main-side__body__message>
                  <div class = "main-side__message-name">
                  ${comment.user_name}
                  </div>
                    <div class = "main-side__message-time">
                  ${comment.text_time}
                    </div>
                      <div class = "main-side__message-body">
                  ${comment.text}
                      </div>
                </div>
                  `
    return html;
  }
  $('.main-side__footer-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
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
      $('.main-side__body').animate({scrollTop: $('.main-side__body')[0].scrollHeight}, 'fast');
      $('#message_body').val('');
    })
    .fail(function(data){
      alert('error');
    })
  })
});
