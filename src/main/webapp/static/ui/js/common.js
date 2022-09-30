$(document).ready(function() {
//	Custom JS

new WOW().init();



(function(){
	var menuAppear = new TimelineMax({paused: true});

	menuAppear.fromTo(".header-search", 0.6, {left: "-100%", opacity: 0, ease: Power3.easeOut},{left: "0%", opacity: 1, ease: Power3.easeOut})
				.from(".search-global__input", 1, {y: 300, opacity: 0, display: "none", ease: Power3.easeOut}, "+=0.6")
				.from(".search-global__note", 1, {y: 90, opacity: 0, ease: Power3.easeOut }, "-=0.2");

	menuAppear.reverse();

	$(document).on("click", ".icon-magnifier.header-search-icon", function() {
		menuAppear.reversed(!menuAppear.reversed());
	});
	$(document).on("click", ".search-close.close", function() {
		// event.preventDefault();
		menuAppear.reversed(!menuAppear.reversed());
	});
})();


/////////////////////////////////////
//		Dropdown Menu
/////////////////////////////////////
	$('ul.nav li.dropdown').hover(function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
	  }, function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	  });

/////////////////////////////////////////////////////////////////
// Slider numbers
/////////////////////////////////////////////////////////////////

if ($('#price-range-slider').length) {

    var keypressSlider = document.getElementById('price-range-slider');
      var input0 = document.getElementById('input-with-keypress-0');
      var input1 = document.getElementById('input-with-keypress-1');
      var inputs = [input0, input1];

      noUiSlider.create(keypressSlider, {
          start: [1000, 50000],
          connect: true,
          step: 100,
          format: wNumb({
            decimals: 0,
            prefix: '$',
            thousand: ','
          }),
          range: {
              'min': 1000,
              'max': 50000
          }
      });

      keypressSlider.noUiSlider.on('update', function (values, handle) {
          inputs[handle].value = values[handle];
      });
  }




/////////////////////////////////////
// Datepicker
/////////////////////////////////////

$('.input-group input').each(function() {
	$(this).datepicker({
				format: "M d, yyyy",
				autoclose: true,
				todayHighlight: true,
				showOtherMonths: true,
				selectOtherMonths: true,
				autoclose: true,
				changeMonth: true,
				changeYear: true,
				startView: "days",
				orientation: "button"
			});
});


/////////////////////////////////////
// Select customization
/////////////////////////////////////

if ($('.selectpicker').length) {
    $('.selectpicker').selectpicker();
  }


/////////////////////////////////////
//	Background Images function
/////////////////////////////////////
	(function(){
		$('.bg-img').each(function(){
			var url = $(this).attr('data-img');
			if(url){
			$(this).css('background-image', 'url(' + url + ')');
			}
		});
	})();

/////////////////////////////////////  
//  OWL Carousel
/////////////////////////////////////  
$('#home-1-cars').owlCarousel({
	loop: true,	
		autoPlay: 1000,
		center: false,
		items: 3,
		margin: 30,
		nav: false,
		responsive : {
			// breakpoint from 0 up
			0 : {
				items: 1,
			},
			// breakpoint from 480 up
			480 : {
				items: 1,
			},
			// breakpoint from 768 up
			768 : {
				items: 2,
			},

			1200 : {
				items: 3,
			}
		}
	}
);

$('#home-1-types').owlCarousel({
		loop: true,	
		autoPlay: 1000,
		center: true,
		items: 5,
		margin: 30,
		nav: false,
		responsive : {
			// breakpoint from 0 up
			0 : {
				items: 1,
			},
			// breakpoint from 480 up
			480 : {
				items: 1,
			},
			// breakpoint from 768 up
			768 : {
				items: 3,
			},
			1024 : {
				items: 3,
			},

			1200 : {
				items: 5,
			}
		}
	}
);


$('#home-1-reviews').owlCarousel({
	loop: true,	
	autoPlay: 1000,
	center: false,
	items: 5,
	margin:40,
	nav: false,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 1,
		},
		// breakpoint from 768 up
		768 : {
			items: 1,
		},

		1200 : {
			items: 2,
		}
	}
	
	}
);

$('#home-1-news').owlCarousel({
	loop: false,	
	autoPlay: 1000,
	center: false,
	items: 5,
	margin:40,
	nav: false,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 1,
		},
		// breakpoint from 768 up
		768 : {
			items: 2,
		},

		1200 : {
			items: 3,
		}
	}
	
	}
);

$('#home-1-logos-carousel').owlCarousel({
	loop: true,	
	autoPlay: 1000,
	// center: true,
	items: 3,
	margin: 30,
	nav: false,
	dots: false,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 2,
		},
		// breakpoint from 768 up
		768 : {
			items: 3,
		},

		1200 : {
			items: 5,
		}
	}
	
	}
);

$('.triple-carousel').owlCarousel({
	loop: false,	
	autoPlay: 1000,
	// center: true,
	items: 2,
	margin: 30,
	nav: false,
	dots: true,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 1,
		},
		// breakpoint from 768 up
		768 : {
			items: 2,
		},

		1200 : {
			items: 3,
		}
	}
	
	}
);

$('#tabs-carousel').owlCarousel({
	loop: true,	
	autoPlay: 1000,
	center: true,
	items: 1,
	margin: 0,
	nav: false,
	dots: true,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 1,
		},
		// breakpoint from 768 up
		768 : {
			items: 1,
		},

		1200 : {
			items: 5,
		}
	}
	
	}
);

$('#review-owl-carousel').owlCarousel({
	loop: true,	
	autoPlay: 1000,
	center: true,
	items: 2,
	margin: 30,
	nav: false,
	dots: true,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 1,
		},
		// breakpoint from 480 up
		480 : {
			items: 1,
		},
		// breakpoint from 768 up
		768 : {
			items: 1,
		},

		1200 : {
			items: 1,
		}
	}
	
	}
);

$('#featured-icons').owlCarousel({
	loop: true,	
	autoPlay: 1000,
	center: false,
	items: 6,
	margin: 40,
	nav: false,
	dots: true,
	responsive : {
		// breakpoint from 0 up
		0 : {
			items: 3,
		},
		// breakpoint from 480 up
		480 : {
			items: 3,
		},
		// breakpoint from 768 up
		768 : {
			items: 3,
		},

		1200 : {
			items: 6,
		}
	}
	
	}
);


$('.cr-tabs a').on('click', function (e) {
	e.preventDefault()
	$(this).tab('show')
  })
	

/////////////////////////////////////
//  Chars Start
/////////////////////////////////////
if ($('body').length) {
    $(window).on('scroll', function() {
        var winH = $(window).scrollTop();

        $('.cr-counters').waypoint(function() {
            $('.js-chart').each(function() {
                CharsStart();
            });
        }, {
            offset: '80%'
        });
    });
}

function CharsStart() {

    $('.js-chart').easyPieChart({
        barColor: false,
        trackColor: false,
        scaleColor: false,
        scaleLength: false,
        lineCap: false,
        lineWidth: false,
        size: false,
        animate: 5000,

        onStep: function(from, to, percent) {
            $(this.el).find('.js-percent').text(Math.round(percent));
        }
    });
}
	

////////////////////////////////////////////
// Sliders with thumbnails
///////////////////////////////////////////

if ($('.js-slider-for').length) {
    $('.js-slider-for').slick({
      arrows: false,
      fade: true,
      asNavFor: '.js-slider-nav'
    });
    $('.js-slider-nav').slick({
      slidesToShow: 5,
      slidesToScroll: 1,
      asNavFor: '.js-slider-for',
	  focusOnSelect: true,
	  responsive: [
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 5,
			slidesToScroll: 1,
			infinite: true,
			dots: true
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 1
		  }
		},
		{
		  breakpoint: 480,
		  settings: {
			slidesToShow: 1,
			slidesToScroll: 1
		  }
		}
		// You can unslick at a given breakpoint now by adding:
		// settings: "unslick"
		// instead of a settings object
	  ]
    });
  }

	
/////////////////////////////////////////////////////////////////
// Map
/////////////////////////////////////////////////////////////////


// When the window has finished loading create our google map below
// google.maps.event.addDomListener(window, 'load', init);

function init() {
	// Basic options for a simple Google Map
	// For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
	var mapOptions = {
		// How zoomed in you want the map to start at (always required)
		zoom: 11,

		// The latitude and longitude to center the map (always required)
		center: new google.maps.LatLng(40.6700, -73.9400), // New York

		scrollwheel: false,


		// How you would like to style the map.
		// This is where you would paste any style found on Snazzy Maps.
		styles: [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}]
	};

	// Get the HTML DOM element that will contain your map
	// We are using a div with id="map" seen below in the <body>
	var mapElement = document.getElementById('map');

	// Create the Google Map using our element and options defined above
	var map = new google.maps.Map(mapElement, mapOptions);

	var image = 'assets/media/general/map-marker.png';
	// Let's also add a marker while we're at it
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(40.6700, -73.9400),
		map: map,
		icon: image,
		draggable: true,
		animation: google.maps.Animation.DROP
	});
	marker.addListener('click', toggleBounce);

	function toggleBounce() {
	  if (marker.getAnimation() !== null) {
		marker.setAnimation(null);
	  } else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	  }
	}
}
});