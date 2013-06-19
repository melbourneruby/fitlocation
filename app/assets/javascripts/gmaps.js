$(document).ready(function(){
	$("#autogen_new_location :submit").click(function(e){
    e.preventDefault();
    navigator.geolocation.getCurrentPosition(showPosition);
    // alert('yay');
	});
	
	function showPosition(position){
	  alert("latitude:"+position.coords.latitude+"\n"+"longitude:"+position.coords.longitude);
	};
});