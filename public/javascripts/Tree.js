var Tree = Class.create({
  initialize: function() {
    this.closedFolder = "/images/admin/tree/closed.png";
		this.openedFolder = "/images/admin/tree/open.png";
		document.on('ajax:before', '.tree_node_icon', function(event, container) {
			if(container.up().hasClassName("opened")){
				event.stop();
				tree.openFolder(container.up().id.replace(/.*_/g, ""));
			}
		});
  },


	openFolder: function(id, tree_type){
		if(tree_type != null )
			folder = $(tree_type+'_folder_'+id);
		else
			folder = $('content_'+id);
		if($(folder).hasClassName("opened")){
			$(folder).removeClassName("opened")
			$(folder).addClassName("closed")
			$(folder).down().down().src=this.closedFolder;
			$(folder).down('ul').remove();
			return false;
		}
		else{
			$(folder).removeClassName("closed")
			$(folder).addClassName("opened")
			$(folder).down().down().src=this.openedFolder
			return true;
		}
	},
	openResourceFolder: function(id){
		return tree.openFolder(id, 'resource');
	},

	setSelected: function(event){
		$('selected_object').value = Element.extend(Event.element(event)).up().id;
		editor.hideTextEditor(true);
	},
	
	refreshFolder: function(id, tree_type){
		if(tree_type == null)
			folder = "folder_"+id
		else
			folder = tree_type +"_folder_"+id
		if($(folder).down('ul')) $(folder).down('ul').remove()
		$(folder).removeClassName("opened")
		$(folder).down().onclick()
	},
	
	refreshResourceFolder: function(id){
		this.refreshFolder(id, 'resource')
	}
});