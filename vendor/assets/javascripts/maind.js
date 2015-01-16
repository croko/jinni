(function($) {
    "use strict";

    /*====================================
    Preloader Script
    ======================================*/
    var ready;
    ready = function() {
        // makes sure the whole site is loaded
        $('#status').fadeOut(); // will first fade out the loading animation
        $('#preloader').delay(50).fadeOut('slow'); // will fade out the white DIV that covers the website.
        $('body').delay(100).css({'overflow':'visible'});
    };

    /*====================================
    NAV SCRIPTS
    ======================================*/
    $(window).bind('scroll', function() {
        var navHeight = $(window).height() - 50;
        if ($(window).scrollTop() > navHeight) {
            $('.navbar-default').addClass('fixed');
        } else {
            $('.navbar-default').removeClass('fixed');
        }
    });

    /*====================================
    Onepage Home Scrollspy
    ======================================*/
    $('body').scrollspy({
        target: '.navbar',
        offset: 80
    });

    /*====================================
    Wow Content Animation 
    ======================================*/
    // Wow animation
      new WOW().init();

    /*====================================
    Carousel Plugin
    ======================================*/
    $(function() {
        $('.carousel').carousel({
            interval: 4000
        });
    });
    $(function() {
        $('#header-slider-one').carousel({
            interval: 4000
        });
    });

    /*====================================
    Accourdion Add Icon 
    ======================================*/
    function toggleChevron(e) {
        $(e.target).prev('.panel-heading').find("i.indicator").toggleClass(
            'fa-minus-square fa-plus-square');
    }
    $('#accordion').on('hidden.bs.collapse', toggleChevron);
    $('#accordion').on('shown.bs.collapse', toggleChevron);

    function toggleTwo(f) {
        $(f.target).prev('.panel-heading').find("i.indicator").toggleClass(
            'fa-chevron-circle-right fa-chevron-circle-down');
    }
    $('#accordion1').on('hidden.bs.collapse', toggleTwo);
    $('#accordion1').on('shown.bs.collapse', toggleTwo);


    $(document).ready(ready);
    $(document).on('page:load', ready);

})(jQuery);