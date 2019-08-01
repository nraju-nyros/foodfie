// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require gmaps/google
//= require_tree .

$(document).ready(function () {
  // Sort by price and avg rating onchange dishes in searchpage
  $('.sort').on('change', function (e) {
    var name = getUrlVars()["search"];
     
    var selected = this.value;
    var data = "";

    if(selected == "ratings"){
      data = {name:name, ratings: this.value}

    }
    else if(selected == "price"){
      data = {name:name, price: this.value}
    }

    e.preventDefault();
    $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: data,
        dataType: "script",
        success: function () {
        }
    });
  });

  // Sorting onchange dishes in searchpage
  $('.sort_rating').on('change', function (e) {
    var name = getUrlVars()["search"];
    var selected = this.value;
    var data = {name:name, ratings_filter: this.value}

    e.preventDefault();
    $.ajax({
      type: "GET",
      url: $(this).attr('href'),
      data: data,
      dataType: "script",
      success: function () {

      }
    });
  });


  // Sorting onchange dishes checkboxes in searchpage
  $('.sort_dietary').on('change', function (e) {
    var category = [];

    $.each($("input[type='checkbox']:checked"), function(){            
      category.push($(this).val());
      console.log('category', category)
      $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {category: category},
        dataType: "script",
        success: function () {

        }
      });
    });
  });

  // Onload google maps
  google.maps.event.addDomListener(window, 'load', initMap);

});


function getUrlVars() {
  var vars = {};
  var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
    vars[key] = value;
  });
 return vars;
}

// google maps
function initMap() {

  var map = new google.maps.Map(document.getElementById('map_canvas'),{
    center: {lat: 20.5937, lng: 78.9629} ,
    zoom: 5,
  });

  var location = gon.locations
  var restaurant = gon.restaurants
  for(var i = 0 ; i < location.length; i++ ){
      var marker = new google.maps.Marker({
        position: {lat: location[i].latitude, lng: location[i].longitude},
        map: map,
        title: gon.restaurants[i].name,
        icon: {
          path: 'M22-48h-44v43h16l6 5 6-5h16z',
          fillColor: '#697f8c',
          fillOpacity: 1,
          strokeColor: '#FFFFFF',
          strokeWeight: 5,
          labelClass: "label", // the CSS class for the label
        }
      }); 
  
  }
}

//Checkboxes in select box 
var expanded = false;
function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}