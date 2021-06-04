$(document).ready(function() {
	//To top button
	$(".totop").hide().click(function() {
		jQuery("html, body").animate({scrollTop:0}, "medium");
	});	
	
	//Scroll
	$(window).bind("scroll", function() {		
		if($(this).scrollTop()>200)  {
			$(".totop").fadeIn();
		} else {
	 		$(".totop").fadeOut();
		}
	});
	
	//Make code pretty
	window.prettyPrint && prettyPrint();
});