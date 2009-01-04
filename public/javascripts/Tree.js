var Tree = Class.create({
  initialize: function() {
    this.closedFolder = "/images/admin/tree/closed.png";
	this.openedFolder = "/images/admin/tree/open.png";
  },


	openFolder: function(id){
	folder = $('folder_'+id);
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

	setSelected: function(event){
		$('selected_object').value = Element.extend(Event.element(event)).up().id;
	},
	
	refreshFolder: function(id){
		folder = "folder_"+id
		if($(folder).down('ul')) $(folder).down('ul').remove()
		$(folder).removeClassName("opened")
		$(folder).down().onclick()
	}
});