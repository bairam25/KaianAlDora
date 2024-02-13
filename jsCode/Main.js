$('.menu-categories .cat-first-level > li').on({
    mouseenter: function () {
        if ($(this).find(' > a + .submenu-wrapper').length !== 0) {
            $(this).addClass('open-megamenu');
            $(this).find(' > a').addClass('active');
            $(this).closest('.menu-categories').addClass('is-open');
        }
    },
    mouseleave: function () {
        if ($(this).find(' > a + .submenu-wrapper').length !== 0) {
            $('.menu-categories .cat-first-level > li').removeClass('open-megamenu');
            $('.menu-categories .cat-first-level > li > a').removeClass('active');
            $(this).closest('.menu-categories').removeClass('is-open');
        }
    }
});

$('.submenu-wrapper .cat-second-level > li').hover(function () {
    if ($(this).find('.cat-third-level').length !== 0) {
        $('.submenu-wrapper .cat-second-level > li').removeClass('active');
        $(this).addClass('active');
    }
});

$('.textfield input').on('change', function () {
    if ($(this).val() && !$(this).hasClass('not-empty')) {
        $(this).addClass('not-empty');
    } else {
        $(this).removeClass('not-empty');
    }
});

$('.dropdown .is-dropdown-submenu-parent').on({
    mouseenter: function () {
        $(this).addClass('is-active');
        $(this).find(' > .is-dropdown-submenu').addClass('js-dropdown-active');
    },
    mouseleave: function () {
        $(this).removeClass('is-active');
        $(this).find(' > .is-dropdown-submenu').removeClass('js-dropdown-active');
    }
});

$('.accordion-item a.accordion-title').on('click', function () {
    $(this).closest('.accordion-item').toggleClass('is-active');
    $(this).next('.accordion-content').slideToggle();
});

$('.header-user-account__propic').on('click', function () {
    $(this).toggleClass('hover');
    $(this).next('.header-user-account__dropdown').toggleClass('is-open');
});

$('.carousel .carousel-item img').on('click', function () {
    $('#pnlFullScreen #imgCarousel').attr('src', $(this).attr('src'));
    $('#pnlFullScreen #imgCarousel').attr('alt', $(this).attr('alt'));
    $('#pnlFullScreen #lblimgTitle').text($(this).attr('alt'));
    $('#pnlFullScreen').show();
});

$('#pnlFullScreen .close-gallery').on('click', function () {
    $('#pnlFullScreen').hide();
});

//$('.carousel .carousel-control-prev').on('click', function () {
//    debugger;
//    let current_Item = $('.carousel-inner .carousel-item.active');
//    let prev_Item = $('.carousel-inner .carousel-item.active').prev('.carousel-item');
//    let last_Item = $('.carousel-inner .carousel-item:last');

//    $(current_Item).css('transform', 'translateX(-100%)');

//    if ($(prev_Item).length == 0) {
//        $(current_Item).toggleClass('active');
//        $(last_Item).toggleClass('active');
//        $(last_Item).css('transform', 'translateX(-100%)');
//    } else {
//        $(prev_Item).css('transform', 'translateX(-100%)');
//        $(current_Item).toggleClass('active');
//        $(last_Item).toggleClass('active');
//    }

//    $('.carousel-inner .carousel-item.active').toggleClass('active').prev('.carousel-item').toggleClass('active');
//});

//Scroll To Top
$('.slide-up-icon').each(function () {
    $(this).on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: 0
        }, $(window).scrollTop() / 3);
        return false;
    });
});

$('.vs-carousel').on('afterChange', function (event, slick, currentSlide, nextSlide) {
    $(slick.$slides).find('[data-ani]').removeClass('vs-animated');
    $(slick.$slides[currentSlide]).find('[data-ani]').addClass('vs-animated');
});