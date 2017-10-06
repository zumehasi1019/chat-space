json.array! @message do |message|
  json.user_name     message.user.name
  json.text_time     message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.text     message.detail
  json.image    message.image
  json.id       message.id
end
