// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function prepZizia(event) {

  console.log("PREPPING ZIZIA JAVASCRIPT EVENTS!! - BEGIN");

  // observer for cloud files being added
  var form = document.getElementById('zizia-csv-imports-new');
  //if (form == null) {
  //  var form = document.getElementsByClassName('edit_importer')[0];
  //}
  // only setup the observer on the new and edit importer pages
  if (form != null) {
      console.log("PREPPING ZIZIA JAVASCRIPT EVENTS!! - FORM");

    var config = { childList: true, attributes: true };
    var callback = function(mutationsList) {
      for(var mutation of mutationsList) {
        if (mutation.type == 'childList') {
          browseButton = document.getElementById('browse');
          var exp = /selected_files\[[0-9*]\]\[url\]/
          for (var node of mutation.addedNodes) {
            if (node.attributes != undefined) {
              var name = node.attributes.name.value
              if (exp.test(name)) {
                browseButton.innerHTML = 'Cloud Files Added';
                browseButton.style.backgroundColor = 'green';
                //browseButton.after(document.createElement("br"), node.value.toString())
              }
            }
          }
        }
      }
    };
    var observer = new MutationObserver (callback);
    observer.observe (form, config);
  }

  console.log("PREPPING ZIZIA JAVASCRIPT EVENTS!! - END");

}

//$(document).on({'ready': prepZizia, 'turbolinks:load': prepZizia})
$(document).on({'turbolinks:load': prepZizia})
