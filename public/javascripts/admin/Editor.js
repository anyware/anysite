var Editor = Class.create({
	initialize: function() {
	  },
	toggleTextEditor: function() {
		if($('content_html')){
			tinyMCE.get('text_editor').setContent($F('content_html'));
			$('div_text_editor').show();
		}else{
			$('div_text_editor').hide();
		}
	 },
	
	getTextEditorValue: function() {
		if($('content_html')){
			$('content_html').setValue(tinyMCE.get('text_editor').getContent());
		}
	}
	
});