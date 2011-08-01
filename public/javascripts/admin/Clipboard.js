var Clipboard = Class.create({
	initialize: function() {
		document.on('click', '.cb_copy', function(event){
				cb.addToClipboard(event.target);
			});
	  },
	addToClipboard: function(target) {
		$('clipboard_list').update("<input type='text' value='" + target.next().value + "'/><input type='button' onclick='cb.import(this);'/>");
	},
	import: function(target) {
		if($('import_action')){
			alert($F('import_action') + target.previous().value);
			$('editor_refresh').down().onClick();
		}else{
			alert("can't import to this object");
		}
	}
});