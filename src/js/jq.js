// Admin bar toggle
;( function( $, window, document, undefined ) {
  'use strict';

  var elListToggleControls = $('.toggle-controls');
	if (elListToggleControls.length === 1) {
		$(elListToggleControls[0]).removeClass('visible-xs');
	}

  var elBody = $('body');
  var elAddPanel = $('.lfr-add-panel');
  var elProductMenu = $('.lfr-product-menu-panel');
  var elToggleButton = $('.js-toggle-admin-mode');

  // No product menu exists
  if(!elProductMenu) {
    return;
  }

  if(elBody.hasClass('custom-admin-controls-closed')) {
    elBody.removeClass('open');
    elBody.addClass('closed');

    elProductMenu.removeClass('open');
    elProductMenu.addClass('closed');
  }

  elToggleButton.addClass('show');
  elToggleButton.on('click', toggleControlMenu);

  function toggleControlMenu() {
    var elBody = $('body');

    if(elBody.hasClass('custom-admin-controls-closed')) {
      Liferay.Store('custom_admin_controls', 'custom-admin-controls-open');
      elBody.removeClass('custom-admin-controls-closed');
      elBody.addClass('custom-admin-controls-open');
    } else if(elBody.hasClass('custom-admin-controls-open')) {
      Liferay.Store('custom_admin_controls', 'custom-admin-controls-closed');
      elBody.removeClass('custom-admin-controls-open');
      elBody.addClass('custom-admin-controls-closed');
    }

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
