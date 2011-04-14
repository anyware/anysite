require "spec_helper"

describe ContactMailer do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it "should contact_us given params" do
    # Send the email, then test that it got queued
    params = Hash["from","mathieu.rousseau.31@gmail.com","subject","This is the subject"]
    # @params[:from] = "mathieu.rousseau.31@gmail.com"
    # @params[:subject] = "This is the subject"
    email = ContactMailer.contact_us(params).deliver
    assert !ActionMailer::Base.deliveries.empty?
  end
end
