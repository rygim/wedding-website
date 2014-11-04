json.array!(@guestbooks) do |guestbook|
  json.extract! guestbook, :id, :name, :message
  json.url guestbook_url(guestbook, format: :json)
end
