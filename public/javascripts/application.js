// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/* Call all function on onload off site page */
Event.observe(window, 'load', fixedMenuIEOver, false);
var tree;
var editor;
var cb;
var windows = new Hash();
var tasks = new Hash();
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
	editor = new Editor();
	cb = new Clipboard();

	document.on('ajax:before', '.tree_node_icon', function(event) {
		sublist = $(event.target).up().down('ul');
		if(sublist){
			sublist.remove();
			tree.closeFolder(event.target.up());
			event.stop();
		}
	});
	
	document.on('ajax:success', '.tree_node_icon', function(event) {
		tree.openFolder(event.target.up());
	});
	
	document.on('ajax:before', 'a', function(response) {
	 	loading();
	});
	document.on('ajax:stopped', 'a', function(response) {
		unloading();
	});
	document.on('ajax:complete', 'a', function(response) {
		unloading();
	});
	document.on('ajax:failure', 'a', function(response) {
		$('editor').update(response.memo.responseText);
	}); 
	
	
	document.on('ajax:before', 'form', function(response) {
		loading();
	});
	document.on('ajax:complete', 'form', function(response) {
		unloading();
	});	
}



