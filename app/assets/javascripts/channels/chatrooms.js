$(document).on('turbolinks:load', function() {
  $('form#new_chatroom_form').submit(function(event) {
    var topic = $('#chatroom_topic').val()
    App.chatrooms.send({topic: topic})
    $('#chatroom_topic').val('')
    return false;
  });
});

App.chatrooms = App.cable.subscriptions.create({ channel: 'ChatroomsChannel'}, { 
  received: function(data) {
    return $("tbody").append(data.template);
  }
});
