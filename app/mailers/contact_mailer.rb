class ContactMailer < ActionMailer::Base
  default :from => "mathieu@anyware-technologies.com.br", :to => 'mathieu@anyware-technologies.com.br'
  
  def contact_us(email)
    @email = email
    mail(:subject => "Contact Us - #{email[:subject]}")
  end
end
