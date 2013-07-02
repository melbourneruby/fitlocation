$(document).ready(function(){
	$("#autogen_new_location :submit").click(function(e){
    e.preventDefault();
    navigator.geolocation.getCurrentPosition(showPosition);
	});
	
	function showPosition(position){
    $("#location_longitude").val(position.coords.longitude);
    $("#location_latitude").val(position.coords.latitude);
    $("#autogen_new_location").submit();
	};
});
