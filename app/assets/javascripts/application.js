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
//= require activestorage
//= require turbolinks


//= require_tree .



//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require bootstrap-datepicker
//= require datatables

//= require datatables/extensions/FixedHeader/dataTables.fixedHeader.js
//= require datatables/extensions/FixedColumns/dataTables.fixedColumns.js

// Select2
//= require select2

// Drag and drop


// Dropdown with search
// require bootstrap-select
// require bootstrap/alert
// require bootstrap/dropdown


// Echarts
// require echarts.min.js
// require echarts/theme/dark.js
//= require echarts


(function () {
  'use strict';
  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    console.log(forms)
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

// $(document).ready(function(){
//   console.log("here")

//   var $fileInput = $('.file_input');
//   var $droparea = $('.file_droparea');

//   $fileInput.on('dragenter focus click', function () {
//     $droparea.addClass('is-active');
//   });

//   $fileInput.on('dragleave blur drop', function () {
//     $droparea.removeClass('is-active');
//   });

//   $fileInput.on('change', function () {
  
//     var filesCount = $(this)[0].files.length;
//     var $textContainer = $(this).prev('.js-set-number');
//     if (filesCount === 1) {
//   $textContainer.text($(this).val().split('\\').pop());
//     } else {
//   $textContainer.text(filesCount + ' uploaded files');
//     }
//   });
// });


// Drag and drop







