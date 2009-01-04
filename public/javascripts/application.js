// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/* Call all function on onload off site page */
Event.observe(window, 'load', fixedMenuIEOver, false);


/**
 * Function to fixed the IE problem with 'over' 
 */
function fixedMenuIEOver() {
	if (document.all&&document.getElementById) { // If IE
		
		var elements = $$("#menu li")
		for (i=0; i<elements.length; i++) {
			node = elements[i];
			if (node.nodeName=="LI") {
				node.onmouseover=function() {
					this.className+=" over";
				}
				node.onmouseout=function() {
					this.className=this.className.replace(" over", "");
				}
			}
		}
	}
}

function init_admin(){
	tree = new Tree();
}