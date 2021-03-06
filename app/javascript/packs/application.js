// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('datatables.net-bs4')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import $ from 'jquery';
global.$ = jQuery;


// Internal imports, e.g:
import { initSelect2 } from '../plugins/init_select2';
import { initFlatpickr } from "../plugins/init_flatpickr";
// import { initSweetalert } from '../plugins/init_sweetalert';
import { initMapbox } from '../plugins/init_mapbox';

import { initChatroomCable} from '../channels/chatroom_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();

  initChatroomCable();

  initFlatpickr();

  initMapbox();

  setTimeout(()=>{
    $('#dashboard_athlete').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false
    })
  }, 1000)

  setTimeout(()=>{
    $('#dashboard_recruit').DataTable( {
          "scrollY":        "200px",
          "scrollCollapse": true,
          "paging":         false
    })
  }, 1000)
  setTimeout(()=>{
    $('#recruit-index').DataTable( {
          "scrollY":        "400px",
          "scrollCollapse": true,
          "paging":         false
    });
  }, 2000)
  setTimeout(()=>{
    $('#athlete-index').DataTable({
          "scrollY":        "400px",
          "scrollCollapse": true,
          "paging":         false
    })
   }, 2000)
//   $('.dropdown-menu').on('hidden.bs.dropdown', function (event) {
//     console.log(event)
// })

});

import "controllers";
