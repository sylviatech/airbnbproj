# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

<script async src="https://www.youtube.com/iframe_api"></script>
  <script>
   function onYouTubeIframeAPIReady() {
    var player;
    player = new YT.Player('myVideo', {
      videoId: 'YDFH-8TBxvQ',
      width: 1280,
      height: 720,
      playerVars: {
        autoplay: 1,        // Auto-play the video on load
        controls: 0,        // Show pause/play buttons in player
        loop: 1,
        showinfo: 0,
        frameborder: 0,
        playlist: 'YDFH-8TBxvQ'
      },
      events: {
        onReady: function(e) {
          e.target.mute();
        }
      }
    });
   }
  </script>