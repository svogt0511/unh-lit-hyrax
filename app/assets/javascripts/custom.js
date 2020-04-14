// zizia csv_import_new - gets our collections list and associated csv file.
//

//$( document ).ready(function() {
$(document).on('turbolinks:load', function() {
  // Run this only on the zizia csv_imports/new page
  //if($('#zizia-csv-imports-new').length && !$('#collections-dropdown').length ){
  if($('#zizia-csv-imports-new').length){
    getCollectionsList();
  }
  // We should not need this here. But somehow the #collections-dropdown sticks around, but the .change callback goes away. (?)
  // Also, the ajax call needs to be synchronous to assure that the .change function executes. Crazy.
  //$('#collections-dropdown').change(function(){
	//getCollectionCsv($(this).val());
  //});
});

// Import_path is set in the form - csv_import/new.
function getCollectionsList() {
    $.ajax({
	type: "GET",
	dataType: "json",
	url: '/greetings/hello',
	async: false,
	cache: false,
	success: function(response){

      var select_title = "<div id='collections-title' class='greetings-title'>SOURCE: " + IMPORT_PATH + "</div>";
	  var select = $("<select></select>").attr("id", "collections-dropdown").attr("name", "collections-dropdown").attr("class", "form-control");
	  select.append($("<option></option>").attr("disabled", "").attr("selected", "").attr("value", "").text("Choose a value"));
	  $.each(response,function(index, value){
	    select.append($("<option></option>").text(value));
	  });

      var collections_title = $('#collections-title');
      var collections_dropdown = $('#collections-dropdown');
      if (collections_dropdown[0]) {
		  $(collections_title[0]).replaceWith(select_title);
		  $(collections_dropdown[0]).replaceWith(select);
      } else {
		  // Goes into the div with id="collections-list" on the zizia-csv-imports-new page.
		  $('#collections-list').append(select_title);
		  $('#collections-list').append(select);
	  }

	  $('#collections-dropdown').change(function(){
	      getCollectionCsv($(this).val());
      });

	  var csv_elmts = $('#csv-elemt');
	  var csv_errs = $('#csv-error');
	  if (csv_elmts[0]) {
	    $(csv_elmts[0]).remove();
	  } else {
	    $(csv_errs[0]).remove();
	  }

	  // Add warning message if response is undefined.
	  var collections_error = $('#collections-error');
	  var collections_html = "<div id='collections-error' class='greetings-error'>There appear to be no collections available for import.</div>";
	  if (response === undefined || response.length == 0) {
	  	if (collections_error[0]) {
	  	    $(collections-error[0]).replaceWith(collections_html)
	  	} else {
	        $('#collections-list').append(collections_html)
	    }
	  }
	},
	error: function(error){
	  console.log("FAILURE!");
	  console.log(error);
	}
  });
}

// Import_path is set in the form - csv_import/new.
function getCollectionCsv(data) {
    $.ajax({
	type: "POST",
	url: '/greetings/hello_csv',
	data: { file_root: data },
	dataType: "json",
	authenticity_token: window._token,
	success: function(response){

	    var csv_html = '';
	    if (response['file']) {
	    	csv_html = '<div id="csv-elemt" class="greetings-file">CSV file: ' + response['file'] + '</div>';
	    } else {
	        csv_html = '<div id="csv-error" class="greetings-error">CSV file not found.</div>';
	    }

		var csv_content = $('#csv-content');
		// if (csv_content[0]) { console.log ("LOADING FILE FROM PATH: " + IMPORT_PATH + '/' + data )}
		if (csv_content[0]) { console.log ("LOADING FILE FROM PATH: " + 'collections/' + data + '/' + data + ".csv" ) }

/*
		// Loading the file from https://site/public.  There is a link to collections in public.
	    $( "#csv-content" ).load( '/collections/' + data + '/' + data + ".csv",function(responseText, statusText, xhr)
			{
				if(statusText == "success")
					alert("Successfully loaded the content!");
					console.log("responseText");
					console.log(responseText);
				if(statusText == "error")
					alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
			});
*/
		var csv_elmts = $('#csv-elemt');
		var csv_errs = $('#csv-error');
		if (csv_elmts[0]) {
	        $(csv_elmts[0]).replaceWith(csv_html);
		} else if (csv_errs[0]) {
	        $(csv_errs[0]).replaceWith(csv_html);
		} else {
	        $('#collections-list').after(csv_html);
		}

		console.log("SUCCESS!")
	},
	error: function(error){
	  console.log("FAILURE!");
	  console.log(error);
	}
  });

}


