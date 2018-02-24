window.jQuery = window.$ = jQuery;
/*
 * 프리로딩 (이미지 프리로더)
 */
jQuery(window).load(function() {
					// Preloader
					setTimeout("jQuery('#preloader').animate({'opacity' : '0'},300,function(){jQuery('#preloader').hide()})",800);
					setTimeout("jQuery('.preloader_hide, .selector_open').animate({'opacity' : '1'},500)",800);
					

				});

$(document).ready(function() {
	// Header Scroll
	$(window).on('scroll', function() {
		var scroll = $(window).scrollTop();

		if (scroll >= 50) {
			$('#header').addClass('fixed');
		} else {
			$('#header').removeClass('fixed');
		}
	});

	// Fancybox
	$('.work-box').fancybox();

	// Flexslider
	$('.flexslider').flexslider({
		animation: "fade",
		directionNav: false,
	});


});