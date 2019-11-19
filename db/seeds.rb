rachel = User.create(username: "rachel", password: "rachel")
eric   = User.create(username: "eric", password: "eric")

chatroom_1 = Chatroom.create(topic: "Tomatoes")
chatroom_2 = Chatroom.create(topic: "Denver")

rachel.messages.create(body: "I love tomatoes", chatroom: chatroom_1)
rachel.messages.create(body: "Denver is cold", chatroom: chatroom_2)

eric.messages.create(body: "Tomato sauce is tasty", chatroom: chatroom_1)
eric.messages.create(body: "I wish I lived in Denver", chatroom: chatroom_2)