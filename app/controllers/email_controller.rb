class EmailController < ApplicationController
  def contact_us
    ContactMailer.contact_us(params[:email]).deliver 
    redirect_to site_path Content.find(params[:content_id])
  end
end
