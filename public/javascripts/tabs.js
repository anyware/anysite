/*-----------------------------------------------------------
    Toggles element's display value
    Input: any number of element id's
    Output: none 
    ---------------------------------------------------------*/
function toggleDisp() {
    for (var i=0;i<arguments.length;i++){
        var d = $(arguments[i]);
        if (d.style.display == 'none')
            d.style.display = 'block';
        else
            d.style.display = 'none';
    }
}
/*-----------------------------------------------------------
    Toggles tabs - Closes any open tabs, and then opens current tab
    Input:     1.The number of the current tab
                    2.The number of tabs
                    3.(optional)The number of the tab to leave open
                    4.(optional)Pass in true or false whether or not to animate the open/close of the tabs
    Output: none 
    ---------------------------------------------------------*/
function toggleTab(clicked_tab_id) {
	var clicked_tab_content = $(clicked_tab_id+"_content");
	var clicked_tab = $(clicked_tab_id);
	if(!(clicked_tab_content.visible())){
		var tabsContent = $('tabscontent').getElementsByClassName('tabContent');
		for(i=0;i<tabsContent.length;i++){
			var tabContent = tabsContent[i];
			if(tabContent.visible()){
				tabContent.hide();
			}
		}
		clicked_tab_content.show();
		var tabs = clicked_tab.up().immediateDescendants();
		for(i=0;i<tabs.length;i++){
			tabs[i].removeClassName('tabHeaderActive');
		}
		clicked_tab.toggleClassName('tabHeaderActive');
	}
	
//	clicked_tab.addClassName('tabHeaderActive');
	
	
	/*
    if ($('tabContent'+num).style.display == 'none'){
        for (var i=1;i<=numelems;i++){
            if ((opennum == null) || (opennum != i)){
                var temph = 'tabHeader'+i;
                var h = $(temph);
                if (!h){
                    var h = $('tabHeaderActive');
                    h.id = temph;
                }
                var tempc = 'tabContent'+i;
                var c = $(tempc);
                if(c.style.display != 'none'){
                    if (animate || typeof animate == 'undefined')
                        //Effect.toggle(tempc,'blind',{duration:0.5, queue:{scope:'menus', limit: 3}});
						toggleDisp(tempc);
                    else
                        toggleDisp(tempc);
                }
            }
        }
        var h = $('tabHeader'+num);
        if (h)
            h.id = 'tabHeaderActive';
        h.blur();
        var c = $('tabContent'+num);
        c.style.marginTop = '2px';
        if (animate || typeof animate == 'undefined'){
            //Effect.toggle('tabContent'+num,'blind',{duration:0.5, queue:{scope:'menus', position:'end', limit: 3}});
			toggleDisp('tabContent'+num);
        }else{
            toggleDisp('tabContent'+num);
        }
    }*/
}