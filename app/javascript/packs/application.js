// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import '../src/application.scss';


import 'materialize-css/dist/js/materialize.js';


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require serviceworker-companion

document.addEventListener('turbolinks:load', function() {
  M.updateTextFields();

  var slidOutMenu                 = document.querySelector('#slide-out');
//     collapsible                 = document.querySelectorAll('.collapsible');
  var datePikers                  = document.querySelectorAll('.datepicker-date');
  var timePikers                  = document.querySelectorAll('.datepicker-time');

  var $select                     = $('select')
//
  var slidOutMenuInstance         = new M.Sidenav(slidOutMenu, {});
//     collapsibleInstance         = M.Collapsible.init(collapsible, {});
  var  datePickerinstances        = M.Datepicker.init(datePikers, { showClearBtn: true, autoClose: true, yearRange: 80 });
  var  timePickerinstances        = M.Timepicker.init(timePikers, { showClearBtn: true, autoClose: true });
//
//
  if ($select.length > 0 )                $('select').select2();
});

document.addEventListener('turbolinks:before-visit', function() {
  var slidOutMenu                 = document.querySelector('#slide-out');
//     collapsible                 = document.querySelectorAll('.collapsible');
  var  datePikers                  = document.querySelectorAll('.datepicker-date');
  var  timePikers                  = document.querySelectorAll('.datepicker-time');
//
//
  var slidOutMenuInstance         = M.Sidenav.getInstance(slidOutMenu);
//
  if (slidOutMenuInstance)    slidOutMenuInstance.destroy();
//
//     if (!!collapsible && collapsible.length > 0) {
//       collapsible.forEach(function (element) {
//         var collapsibleInstances = M.Collapsible.getInstance(element);
//         if (collapsibleInstances) collapsibleInstances.destroy();
//       });
//     };
//
  if (!!datePikers && datePikers.length > 0) {
    datePikers.forEach(function (element) {
      var datePickerinstances = M.Datepicker.getInstance(element);
      if (datePickerinstances) datePickerinstances.destroy();
    });
  };

  if (!!timePikers && timePikers.length > 0) {
    timePikers.forEach(function (element) {
      var timePickerinstances = M.Timepicker.getInstance(element);
      if (timePickerinstances) timePickerinstances.destroy();
    });
  };

});

document.addEventListener('turbolinks:before-cache', function() {
  var $select                     = $('select')

  if ($select.length > 0) $('select').each(function() {
    $(this).select2('destroy');
  });
});
