$(document).ready(function() {
	
	displayInbox();
	
});

function handleClientLoad() {
  gapi.client.setApiKey(apiKey);
  window.setTimeout(checkAuth, 1);
}

function checkAuth() {
  gapi.auth.authorize({
    client_id: clientId,
    scope: scopes,
    immediate: true
  }, handleAuthResult);
}

function handleAuthClick() {
  gapi.auth.authorize({
    client_id: clientId,
    scope: scopes,
    immediate: false
  }, handleAuthResult);
  return false;
}

function handleAuthResult(authResult) {
  if(authResult && !authResult.error) {
    loadGmailApi();
    $('#authorize-button').remove();
    $('.table-inbox').removeClass("hidden");
  } else {
    $('#authorize-button').removeClass("hidden");
    $('#authorize-button').on('click', function(){
      handleAuthClick();
    });
  }
}

function loadGmailApi() {
  gapi.client.load('gmail', 'v1', displayInbox);
}

function displayInbox() {
	  var request = gapi.client.gmail.users.messages.list({
	    'userId': 'me',
	    'labelIds': 'INBOX',
	    'maxResults': 10
	  });

	  request.execute(function(response) {
	    $.each(response.messages, function() {
	      var messageRequest = gapi.client.gmail.users.messages.get({
	        'userId': 'me',
	        'id': this.id
	      });

	      messageRequest.execute(appendMessageRow);
	    });
	  });
}

function appendMessageRow(message) {
	  $('.table-inbox tbody').append(
	    '<tr>\
	      <td>'+getHeader(message.payload.headers, 'From')+'</td>\
	      <td>'+getHeader(message.payload.headers, 'Subject')+'</td>\
	      <td>'+getHeader(message.payload.headers, 'Date')+'</td>\
	    </tr>'
	  );
	}

function appendMessageRow(message) {
	  $('.table-inbox tbody').append(
	    '<tr>\
	      <td>'+getHeader(message.payload.headers, 'From')+'</td>\
	      <td>\
	        <a href="#message-modal-' + message.id +
	          '" data-toggle="modal" id="message-link-' + message.id+'">' +
	          getHeader(message.payload.headers, 'Subject') +
	        '</a>\
	      </td>\
	      <td>'+getHeader(message.payload.headers, 'Date')+'</td>\
	    </tr>'
	  );
	}










