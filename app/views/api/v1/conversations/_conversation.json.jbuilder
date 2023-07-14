json.match_id conversation.id
json.last_message conversation.messages.last&.message
json.unread_messages conversation.messages.present? ? conversation.messages.unread.count : 0
json.user1 do
  json.id         conversation.user1.id
  json.name       conversation.user1.full_name
  json.avatar     conversation.user1.avatar_url
end
json.user2 do
  json.id         conversation.user2.id
  json.name       conversation.user2.full_name
  json.avatar     conversation.user2.avatar_url
end
