class ContactUsController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def create
    # render plain: params[:contact].inspect
    @contact = Contact.new(contact_us_params)
 
    respond_to do |format|
      if @contact.save
        # Tell the Mailer to send an email after save
        ContactMailer.contact_email(@contact).deliver_now
 
        format.html { redirect_to(contactus_path, notice: 'Contact was successfully created.') }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def contact_us_params
    params.permit(:name, :email_address, :message, :submission_date)
  end
end
