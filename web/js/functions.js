/* Loads places into the drop down list when the city is selected
 * If there is only one parking place in the city - makes this item active at once */
function OnSelectCity( select, placeId ) {
    var cityId = select.value;
    
    var placeSelect = document.getElementById( placeId );
    placeSelect.options.length = 1;    
    var counter = 1; 
    
    var placesAllSelect = document.getElementById( 'placesAllId' );
    for ( i = 0; i < placesAllSelect.options.length; i++ ) { 
        var key = placesAllSelect.options[i].value;
        var val = placesAllSelect.options[i].text;
        var arr = key.split( "." );
        if ( arr.length === 2 ) {
            if ( arr[0] === cityId ) {
                placeSelect.options[counter] = new Option( val, arr[1] );
                counter = counter + 1;
            }
        }
    }
    
    if ( placeSelect.options.length === 2 ) {
        placeSelect.selectedIndex = 1;
    }
}

/* Check whether all the components are filled on the form of a vehicle search */
function validateSearchForm( event, selectName ) {
    event.preventDefault(); // this will prevent the submit event.    
    if ( document.SearchForm.dateFrom.value === "" )
    {
      alert ( getOption( selectName, "dateFrom" ) );
      document.SearchForm.dateFrom.focus();
      return false;
    }
    else if ( document.SearchForm.dateTo.value === "" )
    {
      alert( getOption( selectName, "dateTo" ) );
      document.SearchForm.dateTo.focus();
      return false;
    }
    else if ( document.SearchForm.ddlPlaceFrom.selectedIndex === 0 )
    {
      alert( getOption( selectName, "placeFrom" ) );
      document.SearchForm.ddlPlaceFrom.focus();
      return false;
    }
    else if ( document.SearchForm.ddlPlaceTo.selectedIndex === 0 )
    {
      alert( getOption( selectName, "placeTo" ) );
      document.SearchForm.ddlPlaceTo.focus();
      return false;
    }
    else { 
        document.SearchForm.submit();// fire submit event
    }
}

/* Returns a message if a component is empty */
function getOption( element, name ) {
    var msg = "Please enter value";
    var msgSelect = document.getElementById( element );
    for ( i = 0; i < element.options.length; i++ ) { 
        var key = element.options[i].value;
        var val = element.options[i].text;
        if ( key === name ) {
            return val;
        }
    }
    return msg;
}