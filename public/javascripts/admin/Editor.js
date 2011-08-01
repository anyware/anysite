var Editor = Class.create({
	initialize: function() {
		document.on('click', '.edit_html', function(event){
					$(event.target).up(1).down('.html_output').hide();
					text_area = $(event.target).up(1).down('.text_editor');
					text_area.show();
					tinyMCE.init({theme : "advanced",mode : "exact", elements: text_area.id});
		});
		document.on('click', '.task_close', function(event){
			var generic_id = $(event.target).up().id.replace("task_","");
			editor.close(generic_id);
		});
		document.on('click', '.task_name', function(event){
			var generic_id = $(event.target).up().id.replace("task_", "");
			editor.showWindow(generic_id);
		})
	  },
	
	createTabControl: function(tabs,options){
		new Control.Tabs(tabs, Object.extend({
			setClassOnContainer:true
			},options || {})
		);
	},
	
	close: function(generic_id){
		$('task_' + generic_id).remove();
		$('window_' + generic_id).remove();
	},
	
	showWindow: function(generic_id){
		$$("div.task").each(function(task){task.removeClassName("active")});
		windows[generic_id].bringToFront();
		tasks[generic_id].addClassName("active");
	},
	
	createTask: function(name, type, generic_id){
		if($("task_" + generic_id)){
			editor.showWindow(generic_id);
			return;
		}
		var task = new Element('div',{
			class:type + " task",
			id: "task_" + generic_id
		});
		var task_name = new Element('div',{
			class:'task_name'
		});
		task_name.insert(name);
		task.insert(task_name);
		var task_close = new Element('div',{
			class:"task_close"
		});
		task.insert(task_close);
		$('taskbar').insert(task);
		tasks[generic_id] = task;
		editor.showWindow(generic_id);
	},
	
	windowFactory: function(type, id, name, options){
		var generic_id = type+"_"+id;
		var window_id = 'window_' + type + "_" + id;
		var container = new Element('div',{
			id: window_id
		});
		if($(window_id))
		  $(window_id).remove();
		$("windows").insert(container);
		var window_header = new Element('div',{  
        className: 'window_header'
    });  
    var window_title = new Element('div',{
        className: 'window_title'
    });
    var window_close = new Element('div',{  
        className: 'window_close'
    });
    var window_refresh = new Element('div',{  
        className: 'window_refresh'
    });
		var w = new Control.Window.open(container,Object.extend({  
        className: 'window',  
        closeOnClick: window_close,
				offsetLeft:200,
				offsetTop:50,
				position:[0,0],
				width:850,
				fade:true,
				fadeDuration:0.5,
        afterOpen: function(){  
        }  
    },options || {}));
    w.container.insert(window_header);
    window_header.insert(window_title);
    window_header.insert(window_refresh);
    window_header.insert(window_close);
		windows[generic_id] = w;
		editor.createTask(name, type, generic_id);
    return w;
	}
});