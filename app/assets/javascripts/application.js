// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .
function init() {
    gapi.load('auth2', function() {
      // Ready.
      $('.google-login-button').click(function(e) {
        e.preventDefault();
        
        gapi.auth2.authorize({
          client_id: 'YOUR_CLIENT_ID',
          cookie_policy: 'single_host_origin',
          scope: 'email profile',
          response_type: 'code'
        }, function(response) {
          if (response && !response.error) {
            // google authentication succeed, now post data to server.
            jQuery.ajax({type: 'POST', url: '/auth/google_oauth2/callback', data: response,
              success: function(data) {
                // response from server
              }
            });        
          } else {
            // google authentication failed
          }
        });
      });
    });
  };