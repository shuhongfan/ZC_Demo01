jQuery(function($) {

    "use strict";

    $(function() {

    	/*
         * Split nav
         */

        UIkit.$win.on('load resize orientationchange', (function(){

            var fn = function() {

                var logowidth   = $('.bh-logo').outerWidth(),
                    nav         = $('.bh-navbar .uk-navbar-nav'),
                    navwrap     = $('.bh-navbar-nav-wrapper'),
                    navitems    = nav.children(),
                    equal       = Math.ceil(navitems.length / 2),
                    rtl         = ($.UIkit.langdirection == 'right'),
                    movenav     = 0;

                    navwrap.css('visibility', 'hidden');

                navwrap.css({ 'margin-right':'', 'margin-left':'' });
                navitems.eq(equal - 1).css({ 'margin-right':'', 'margin-left':'' });

                for( var i = 0; i < equal; i++ ) {
                    movenav += navitems.eq(i).width();
                }

                movenav = (navwrap.width() - movenav) - movenav;

                navwrap.css(rtl ? 'margin-right' : 'margin-left', movenav);
                navitems.eq(equal - 1).css(rtl ? 'margin-left' : 'margin-right', logowidth + 10);

                setTimeout(function(){
                    navwrap.css('visibility', '');
                }, 150);

                return fn;
            };

            return fn();

        })());

        /*
         * Search Focus
         */

        $('.bh-search-toggle').on('click', function(){
            setTimeout(function(){
                $('.bh-search-bar input:first').focus();
            }, 50);
        });

        /*
         * Counter
         */

        if(window.countUp) {

            $('[data-count-up]').each(function(){

                var ele       = $(this),
                    options   = $.UIkit.Utils.options(ele.attr('data-count-up')) || {},
                    counter   = new countUp(this, options.start || 0, options.end || 100, 0, options.duration || 1.5, options);

                ele.on('inview.uk.scrollspy', function(){
                    counter.start();
                });

                var scrollspy = $.UIkit.scrollspy(ele);
            });
        }

        /*
         * Init Map
         */

        (function initmap() {

            // Get the HTML DOM element that will contain your map
            // We are using a div with id="map" seen below in the <body>
            var mapElement = document.getElementById('pages-contact-map');

            if (mapElement) {

                // Basic options for a simple Google Map
                // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
                var mapOptions = {

                    scrollwheel: false,

                    draggable: !$.UIkit.support.touch,

                    // How zoomed in you want the map to start at (always required)
                    zoom: 11,

                    // The latitude and longitude to center the map (always required)
                    center: new google.maps.LatLng(59.916579, 10.751471), // Oslo

                    // How you would like to style the map.
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [{"featureType":"landscape","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"stylers":[{"hue":"#00aaff"},{"saturation":-100},{"gamma":2.15},{"lightness":12}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"visibility":"on"},{"lightness":24}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":57}]}]
                };

                // Create the Google Map using out element and options defined above
                var map = new google.maps.Map(mapElement, mapOptions);
            }

        })();

    });

});
