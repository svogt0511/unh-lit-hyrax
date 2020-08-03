// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function prepZizia(event) {

  // observer for cloud files being added
  var form = document.getElementById('zizia-csv-imports-new');
  //if (form == null) {
  //  var form = document.getElementsByClassName('edit_importer')[0];
  //}
  // only setup the observer on the new and edit importer pages
  if (form != null) {

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

          my_json =  JSON.stringify( $("[name='selected_files']") );
          var values = $("input[name='selected_files']").map(function(){return $(this).val();});

					//var data = JSON.stringify( $(form).serializeArray() );
/*
					var myForm = $("form#zizia-csv-imports-new");
					var myValues = $("input[name='selected_files[]']").serializeArray();
					//$.each($($("form#zizia-csv-imports-new input[title*='selected_files']")).serializeArray(), function(i, field) {
    			//		values[field.name] = field.value;
          //});
          /*
          var cloud_files = $.each( myValues , function(i, field) {
              values[i] = field.value;
    					//values[field.name] = field.value;

    					console.log (i);
    					console.log ( field );
          });
          --/

          var myCloudFiles = (function (myArr) {
          	var i;
          	var values = [];
						for (i = 0; i < myArr.length; i++) {
  						values[i] = myArr[i]['value'];
						}
						return values;
					})(myValues);

					var cloud_files = JSON.stringify( myCloudFiles );

					console.log (myValues);
					console.log (myCloudFiles);
					console.log (cloud_files);
					console.log ('AAAAA middle 1');
					//data = JSON.stringify( $("input[name='selected_files*']").serializeArray() );
					//console.log (data);

					//var obj = JSON.parse(data);
					//data = obj.selected_files;
					//console.log (data);
         /*
          $("[name='selected_files']").each( obj, function( key, value ) {
            console.log( key + ": " + value );
          });--/
          */

  				var myForm = $("form#zizia-csv-imports-new");
					var myValues = $("[name^='selected_files']").not("[name='selected_files[]']").serializeArray();
					var myFiles = JSON.stringify( myValues )

					var i = 0;
					var loop = true;
					var myFiles = {};
					while ( $("[name^='selected_files[" + i + "]']").length ) {

					   console.log ( $("[name^='selected_files[" + i + "]']") );

					   i_str = i.toString();
					   myFiles[i] = {};

					  // myFiles[i].url = $("[name^='selected_files[" + i + "][url]']").first;
					  // myFiles[i].file_name = $("[name^='selected_files[" + i + "][file_name]']").first;
					  // myFiles[i].file_size = $("[name^='selected_files[" + i + "][file_size]']").first;
					  myFiles[i_str].url = $("[name^='selected_files[" + i + "][url]']").first().val();
					  myFiles[i_str].file_name = $("[name^='selected_files[" + i + "][file_name]']").first().val();
					  myFiles[i_str].file_size = $("[name^='selected_files[" + i + "][file_size]']").first().val();

					   i++;
					}

					var provider = $( "#provider-select option:selected" ).text().trim();

					if (provider !== "Dropbox") {

										$.ajax({
											url: "/csv_imports/be_upload",
											type: 'post',
											dataType: 'json',
											data: { "cloud_files" : JSON.stringify( myFiles ) },
											//data: $("[name='selected_files']").stringify(),
											success: function(resp) {
												console.log(resp);
											}
										});

					}
        }
      }

    };
    var observer = new MutationObserver (callback);
    observer.observe (form, config);


  }

}

//$(document).on({'ready': prepZizia, 'turbolinks:load': prepZizia})
$(document).on({'turbolinks:load': prepZizia})
