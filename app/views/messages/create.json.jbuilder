  json.text       @message.detail
  json.id         @message.user.id
  json.user_name  @message.user.name
  json.text_time  @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
