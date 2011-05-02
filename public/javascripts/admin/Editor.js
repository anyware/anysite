var Editor = Class.create({
	initialize: function() {
		document.on('click', '.tab_header', function(event){
			$$('.tab_content').invoke('hide');
			$(event.target.id + '_content').show();
			if($(event.target.id + '_content').down('#content_html') != undefined)
				$('div_text_editor').show();				
			else
				$('div_text_editor').hide();
		});
	  },
	toggleTextEditor: function() {
		if($('content_html')){
			tinyMCE.get('text_editor').setContent($('content_html').value);
			$('div_text_editor').show();
		}else{
			$('div_text_editor').hide();
		}
	 },
	
	hideTextEditor: function() {
		$('div_text_editor').hide();
	},
	
	getTextEditorValue: function() {
		if($('content_html')){
			$('content_html').setValue(tinyMCE.get('text_editor').getContent());
		}
	},
	
	toogleTab: function() {
		$('.tabContent').invoke('toggle');
	}
});