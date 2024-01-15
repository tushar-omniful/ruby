class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    render json: @contacts , status: :created
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
