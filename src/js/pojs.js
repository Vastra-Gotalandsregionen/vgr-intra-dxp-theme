// Plain javascript that runs before AUI is ready (to prevent content flashing

window.onload= onWindowLoad;

function onWindowLoad() {
	// Body
	addCssClass(document.body, 'js');
	//bindNavigationTrigger(document.getElementById('navigationTrigger'));
	//bindToggleSubNav(document.getElementById('navigation'));
}

function hasCssClass(elem, className) {
	if(elem) {
		return new RegExp(' ' + className + ' ').test(' ' + elem.className + ' ');
	}
}

function addCssClass(elem, className) {
	if(elem) {
	    if (!hasCssClass(elem, className)) {
	    	elem.className += ' ' + className;
	    }
    }
}

function removeCssClass(elem, className) {

	var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, ' ') + ' ';
	if (hasCssClass(elem, className)) {
		while (newClass.indexOf(' ' + className + ' ') >= 0 ) {
			newClass = newClass.replace(' ' + className + ' ', ' ');
		}
		elem.className = newClass.replace(/^\s+|\s+$/g, '');
	}
}

function toggleCssClass(elem, className) {
	if(hasCssClass(elem, className)) {
		removeCssClass(elem, className);
	} else {
		addCssClass(elem, className);
	}
}

function bindNavigationTrigger(navigationTrigger) {
	if(navigationTrigger) {

		navigationTrigger.onclick = function(e) {
			toggleCssClass(document.body, 'show-navigation')
			return false;
		}
		addCssClass(navigationTrigger, 'navigation-trigger-ready');
	}
}

function bindToggleSubNav(navMenu) {
	if(navMenu) {
		var toggleSubNavLinks = navMenu.getElementsByClassName('toggle-sub-nav');

		for (i = 0; i < toggleSubNavLinks.length; i++) {
			toggleSubNavLinks[i].onclick = function(e) {

				var parentListItem = this.parentElement.parentElement;

				toggleCssClass(parentListItem, 'show-sub-nav');
				return false;
			}
		}

	}
}
