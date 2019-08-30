// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// //= require jquery
// //= require rails-ujs
// //= require activestorage
// //= require turbolinks
// //= require materialize
// //= require_tree .
//
// document.addEventListener('turbolinks:load', function() {
//     M.updateTextFields();
//
//     slidOutMenu                 = document.querySelector('#slide-out');
//     actionBtn                   = document.querySelector('.fixed-action-btn');
//     collapsible                 = document.querySelectorAll('.collapsible');
//     datePikers                  = document.querySelectorAll('.datepicker-date');
//     timePikers                  = document.querySelectorAll('.datepicker-time');
//
//     $select                     = $('select')
//
//     slidOutMenuInstance         = new M.Sidenav(slidOutMenu, {});
//     actionBtnInstance           = new M.FloatingActionButton(actionBtn, { direction: 'left' });
//     collapsibleInstance         = M.Collapsible.init(collapsible, {});
//     datePickerinstances         = M.Datepicker.init(datePikers, { showClearBtn: true, autoClose: true, yearRange: 80 });
//     timePickerinstances         = M.Timepicker.init(timePikers, { showClearBtn: true, autoClose: true });
//
//
//     if ($select.length > 0 )                $('select').select2();
//   });
//
// document.addEventListener('turbolinks:before-visit', function() {
//     slidOutMenu                 = document.querySelector('#slide-out');
//     actionBtn                   = document.querySelector('.fixed-action-btn');
//     collapsible                 = document.querySelectorAll('.collapsible');
//     datePikers                  = document.querySelectorAll('.datepicker-date');
//     timePikers                  = document.querySelectorAll('.datepicker-time');
//
//
//     slidOutMenuInstance         = M.Sidenav.getInstance(slidOutMenu);
//     actionBtnInstance           = M.FloatingActionButton.getInstance(actionBtn);
//
//     if (slidOutMenuInstance)    slidOutMenuInstance.destroy();
//     if (actionBtnInstance)      actionBtnInstance.destroy();
//
//     if (!!collapsible && collapsible.length > 0) {
//       collapsible.forEach(function (element) {
//         var collapsibleInstances = M.Collapsible.getInstance(element);
//         if (collapsibleInstances) collapsibleInstances.destroy();
//       });
//     };
//
//     if (!!datePikers && datePikers.length > 0) {
//       datePikers.forEach(function (element) {
//         var datePickerinstances = M.Datepicker.getInstance(element);
//         if (datePickerinstances) datePickerinstances.destroy();
//       });
//     };
//
//     if (!!timePikers && timePikers.length > 0) {
//       timePikers.forEach(function (element) {
//         var timePickerinstances = M.Timepicker.getInstance(element);
//         if (timePickerinstances) timePickerinstances.destroy();
//       });
//     };
//
//   });
//
// document.addEventListener('turbolinks:before-cache', function() {
//   if ($select.length > 0) $('select').each(function() {
//     $(this).select2('destroy');
//   });
// });
