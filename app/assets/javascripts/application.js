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
//= require jquery
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .





//home
//https://codepen.io/himanshu/pen/syLAh
var i = 1;
$('.progress .circle').removeClass().addClass('circle');
$('.progress .bar').removeClass().addClass('bar');
setInterval(function () {
    $('.progress .circle:nth-of-type(' + i + ')').addClass('active');

    $('.progress .circle:nth-of-type(' + (i - 1) + ')').removeClass('active').addClass('done');

    $('.progress .circle:nth-of-type(' + (i - 1) + ') .label').html('&#10003;');

    $('.progress .bar:nth-of-type(' + (i - 1) + ')').addClass('active');

    $('.progress .bar:nth-of-type(' + (i - 2) + ')').removeClass('active').addClass('done');

    i++;

    if (i == 0) {
        $('.progress .bar').removeClass().addClass('bar');
        $('.progress div.circle').removeClass().addClass('circle');
        i = 1;
    }
}, 1000);

//popup
var modal = document.getElementById('myModal');

var btn = document.getElementById("btnCancel");

var span = document.getElementsByClassName("close")[0];

btn.onclick = function () {
    modal.style.display = "block";
}

span.onclick = function () {
    modal.style.display = "none";
}

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}