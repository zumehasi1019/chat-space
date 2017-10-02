$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=${message.id}>${message.user_name}</a>
                    ：
                  </strong>
                  ${message.body}
                </p>`
    return html;
  }
  $('#message_body').on('submit', function(e){
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
      $('.message').append(html)
      $('.message_body').val('')
    })
  })
});
