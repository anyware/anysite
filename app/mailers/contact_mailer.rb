class ContactMailer < ActionMailer::Base
  default :from => "mathieu@anyware-technologies.com.br"
  
  def contact_us(email)
    mail(:to => 'mathieu@anyware-technologies.com.br',
             :subject => email[:subject],
             :from => email[:from])
  end
end
