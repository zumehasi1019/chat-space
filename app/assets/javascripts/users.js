$(function(){
  var search_list = $("#user-search-result");
  var chat_member = $("#chat_member_js");
  var remove_list = $(".chat-group-user__name")

  function appendListedUser(user) {
  var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name"> ${ user.name } </p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }", data-user-name= "${ user.name }">追加</a>
                </div>`
    search_list.append(html);
  }
  function appendAddedUser(id,name) {
   var html = `<div class="chat-group-user clearfix id="chat-group-user-"${id}">
               <input name="group[user_ids][]" type="hidden" value="${id}">
                 <p class="chat-group-user__name"> ${ name } </p>
                 <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${ id }", data-user-name= "${ name }">削除</a>
               </div>`

   chat_member.append(html);
   $("#chat_member_js").on("click", ".chat-group-user__btn--remove", function() {
    $(this).parent().remove();
   });
  }

  $("#user-search-field").on('keyup', function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(user) {
     $("#user-search-result").empty();
     if (user.length !== 0) {
       user.forEach(function(user){
         appendListedUser(user);
       });
     }
     else {
       appendNoUser("一致する名前がありません");
     }
   })
     .fail(function() {
      alert('名前検索に失敗しました');
    })
  });
  $(".chat-group-form__field").on("click",".chat-group-user__btn", function() {
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    console.log(name);
    appendAddedUser(id, name);
    $(this).parent().remove();
  });
});
