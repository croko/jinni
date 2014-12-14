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
            interval: 3000
        });
    });
    $(function() {
        $('#header-slider-one').carousel({
            interval: 3000
        });
    });

    /*====================================
    Script for the Counters for Facts Section
    ======================================*/
    $('.count').each(function() {
        var $this = $(this);
        $this.data('target', parseInt($this.html()));
        $this.data('counted', false);
        $this.html('0');
    });
    $(window).bind('scroll', function() {
        var speed = 3000;
        $('.count').each(function() {
            var $this = $(this);
            if (!$this.data('counted') && $(window).scrollTop() +
                $(window).height() >= $this.offset().top) {
                $this.data('counted', true);
                $this.animate({
                    dummy: 1
                }, {
                    duration: speed,
                    step: function(now) {
                        var $this = $(this);
                        var val = Math.round(
                            $this.data(
                                'target') *
                            now);
                        $this.html(val);
                        if (0 < $this.parent(
                            '.value').length) {
                            $this.parent(
                                '.value').css(
                                'width',
                                val + '%');
                        }
                    }
                });
            }
        });
    }).triggerHandler('scroll');

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

    /*====================================
    Portfolio Isotope Filter
    ======================================*/
    $(window).load(function() {
        var $container = $('.portfolioContainer');
        if ($container.length > 0) {
            $container.isotope({
                filter: '*',
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            $('.item-cat a').click(function () {
                $('.item-cat .current').removeClass('current');
                $(this).addClass('current');
                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });
                return false;
            });
        }});

    $(document).ready(ready);
    $(document).on('page:load', ready);

})(jQuery);