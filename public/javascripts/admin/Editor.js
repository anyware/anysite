var Editor = Class.create({
	initialize: function() {
	  },
	showTextEditor: function(id_text) {
		xinha_editors.text_editor.config.height = '480px';
		xinha_editors.text_editor.initSize();
		if(id_text != null)
			xinha_editors.text_editor.setHTML($F(id_text));
		$('div_text_editor').show();
		$('div_text_editor').style.visibility = '';
	 },
	
	hideTextEditor: function(clear) {
		if(clear)
			xinha_editors.text_editor.setHTML('');
		$('div_text_editor').hide();
	 },
	
});