/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require materialize
//= require_tree .

document.addEventListener('turbolinks:load', function() {
    M.updateTextFields();
    
    slidOutMenu                 = document.querySelector('#slide-out');
    collapsible                 = document.querySelectorAll('.collapsible');

    slidOutMenuInstance         = new M.Sidenav(slidOutMenu, {});
    collapsibleInstance         = M.Collapsible.init(collapsible, {});
  });

document.addEventListener('turbolinks:before-visit', function() {
    slidOutMenu                 = document.querySelector('.sidenav');
    collapsible                 = document.querySelectorAll('.collapsible');

    slidOutMenuInstance         = M.Sidenav.getInstance(slidOutMenu);

    if (slidOutMenuInstance)    slidOutMenuInstance.destroy();

    if (!!collapsible && collapsible.length > 0) {
      collapsible.forEach(function (element) {
        var collapsibleInstances = M.Collapsible.getInstance(element);
        if (collapsibleInstances) collapsibleInstances.destroy();
      });
    };

  });
