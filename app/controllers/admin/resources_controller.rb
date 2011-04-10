class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_user!
  
  def update_positions
  end
  
  def destroy
    resource = Resource.find(params[:id])
    @folder = resource.folder
    resource.destroy
  end
  
  def edit
    @resource = Resource.find(params[:id])
    render "editor"
  end
  
  def new
    @folder = Folder.find(params[:folder_id])
    @resource =Resource.new
    render "editor"
  end
  
  def create
    @resource = Resource.new(params[:resource])
    @resource.folder = Folder.find(params[:target_id])
    @resource.folder && @resource.save
    render "form"
  end
  
  def show
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    responds_to_parent do
      render :update do |page|
        if @resource.update_attributes(params[:resource])
          page.replace_html 'main_tab_content', :partial => 'edit', :object => @resource
        else
          page.alert('error')
        end
      end
    end
    # @resource.update_attributes(params[:resource])
    # render "editor"
  end
  
  def responds_to_parent(&block)
      yield

      if performed?
      # We're returning HTML instead of JS or XML now
      response.headers['Content-Type'] = 'text/html; charset=UTF-8'

      # Either pull out a redirect or the request body
      script =  if response.headers['Location']
                  #TODO: erase_redirect_results is missing in rails 3.0 has to be implemented
#                  erase redirect
                  "document.location.href = #{location.to_s.inspect}"
                else
                  response.body
                end

      # Escape quotes, linebreaks and slashes, maintaining previously escaped slashes
      # Suggestions for improvement?
      script = (script || '').
        gsub('\\', '\\\\\\').
        gsub(/\r\n|\r|\n/, '\\n').
        gsub(/['"]/, '\\\\\&').
        gsub('</script>','</scr"+"ipt>')

      # Clear out the previous render to prevent double render
      response.request.env['action_controller.instance'].instance_variable_set(:@_response_body, nil)

      # Eval in parent scope and replace document location of this frame
      # so back button doesn't replay action on targeted forms
      # loc = document.location to be set after parent is updated for IE
      # with(window.parent) - pull in variables from parent window
      # setTimeout - scope the execution in the windows parent for safari
      # window.eval - legal eval for Opera
      render :text => "<html><body><script type='text/javascript' charset='utf-8'>
        var loc = document.location;
        with(window.parent) { setTimeout(function() { window.eval('#{script}'); if (typeof(loc) !== 'undefined') loc.replace('about:blank'); }, 1) };
        </script></body></html>".html_safe
      end
  end
end
