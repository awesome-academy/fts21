$(document).ready(function()
{
    (function() {
      App.activities = App.cable.subscriptions.create({
        channel: 'ActivitiesChannel'
      },
      {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          $('#acitivities').prepend(data.activity);
          $('.no_activity').remove();
        },
      });
  }).call(this);
});
