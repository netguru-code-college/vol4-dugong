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
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .


// Function for map displaying
function passParam(latit, lang){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: latit, lng: lang},
    zoom: 8
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: {lat: latit, lng: lang}
  });
  $( document ).ready(function() {
    $('input#story_latitude').val(latit)
    $('input#story_longitude').val(lang)
});

  google.maps.event.addListener(marker, 'dragend', function() {
  console.log(this.getPosition().lat());
  console.log(this.getPosition().lng());
  $('input#story_latitude').val(this.getPosition().lat())
  $('input#story_longitude').val(this.getPosition().lng())
  })

}
