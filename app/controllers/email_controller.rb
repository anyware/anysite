class EmailController < ApplicationController
  def contact_us
    begin
      ContactMailer.contact_us(params[:email]).deliver 
      @message = "Email enviado com sucesso"
      params.delete :email
    rescue
      @message = "Occorreu um erro ao enviar o email."
    end
    @content = Content.find(params[:content_id])
    render :action => "layouts/site"
  end
end
