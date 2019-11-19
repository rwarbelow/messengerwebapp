$(document).on('turbolinks:load', function() {
  autoScroll();
  var chatroomId = $("[data-chatroom]").data().chatroom
  checkSubscription(chatroomId);
  $('form#post_message_form').submit(function(event) {
    var messageBody = $('#message_body').val();
    App['room' + chatroomId].send({messageBody: messageBody});
    $('#message_body').val('');
    return false;
  });
});


function createRoomConnection(chatroomId) {
  App['room' + chatroomId] = App.cable.subscriptions.create({ channel: 'MessagesChannel', room: chatroomId}, {  
    received: function(data) {
      autoScroll();
      return $("[data-chatroom='" + chatroomId + "']").append(data.template);
    }
  })
}

function checkSubscription (chatroomId) {
  if (App['room' + chatroomId] == undefined) {
    createRoomConnection(chatroomId);
  }
}

function autoScroll() {
  if($('.messages').length > 0) {
    $('.messages').stop().animate({ scrollTop: $('.messages')[0].scrollHeight}, 500);
  }
}