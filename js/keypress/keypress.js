jQuery(window).on("keypress", function(e) {


	console.log("keycode = ", e.keyCode);
	var top = $('#content').css('top');
	var left = $('#content').css('left');
	if (e.keyCode == 119) {
		console.log("top = ", top);
		$('#content').css('top', (parseInt(top) - 15) + "px");
	}
	if (e.keyCode == 115) {
		console.log("top = ", top);
		$('#content').css('top', (parseInt(top) + 15) + "px");
	}

	if (e.keyCode == 97) {
		console.log("left = ", left);
		$('#content').css('left', (parseInt(left) - 15) + "px");
	}

	if (e.keyCode == 100) {
		console.log("left = ", left);
		$('#content').css('left', (parseInt(left) + 15) + "px");
	}

});