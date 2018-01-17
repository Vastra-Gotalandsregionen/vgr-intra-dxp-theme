// Mega drop down
//
// Admin bar toggle
;( function( $, window, document, undefined ) {
  'use strict';

  // TODO: implement timer on mouseenter and mouseleave like old version
  var currentTimer;

  var menuNode = $('#navigation');
  var dropdownItems = $('#navigation .dropdown');

  dropdownItems.hover(onDropdownMouseEnter, onDropdownMouseLeave);

  function onDropdownMouseEnter(e) {
    var currentTarget = $(e.currentTarget);

    dropdownItems.removeClass('on');
    dropdownItems.find('.mega-drop').removeClass('on');

    currentTarget.addClass('on');
    currentTarget.find('.mega-drop').addClass('on');

  }

  function onDropdownMouseLeave(e) {
    var currentTarget = $(e.currentTarget);

    currentTarget.removeClass('on');
    currentTarget.find('.mega-drop').removeClass('on');


  }



})( jQuery, window, document );


// Sticky Navigation
// initStickyNavigation();
//
// function initStickyNavigation() {
//   var navWrapper = $('.navigation-wrapper');
//   var navScrolledCssClass = 'navigation-wrapper-scrolled';
//   var scrollHeightLimit = $('.banner-nav').height();
//   scrollHeightLimit = scrollHeightLimit*0.7;
//
//
//   $(window).scroll(function() {
//     if( $(this).scrollTop() > scrollHeightLimit ) {
//       navWrapper.addClass(navScrolledCssClass);
//     } else {
//       navWrapper.removeClass(navScrolledCssClass);
//     }
//   });
// }
