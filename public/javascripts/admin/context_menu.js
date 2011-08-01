function loading(){
	// $("animated_anyware_logo").style.opacity="";
	// $("animated_anyware_logo").show();
}
function unloading(){
	// Effect.Fade('animated_anyware_logo', {duration: 0.5});
}

function showMenu(event, menu_id){
	
 	$('right_clicked_item').value = Event.element(event).up().id;
	
	menuobj = document.getElementById(menu_id)

	menuobj.style.left = Event.pointerX(event)+"px"
	menuobj.style.top = Event.pointerY(event)+"px"

	menuobj.style.visibility="visible"
	return false;
}

function hideAllMenu(e){
for(i=0;i<menus.length;i++)
menus[i].style.visibility="hidden"
}

function setTargetId(){
	if($('target_id')){
		$('target_id').value = $('right_clicked_item').value.gsub(".*_", "")
	}
}

