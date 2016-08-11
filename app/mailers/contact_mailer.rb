class ContactMailer < ApplicationMailer
  default from: "contact@northsideusa.com"
  
   def contact_email(contact)
    @contact = contact
    mail(to: "contact@northsideusa.com", subject: 'Northside USA Contact Us Submission')
  end
end
