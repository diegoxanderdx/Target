json.match_id conversation.id
json.user1 do
  json.id         conversation.user1.id
  json.name       conversation.user1.full_name
end
json.user2 do
  json.id         conversation.user2.id
  json.name       conversation.user2.full_name
end
