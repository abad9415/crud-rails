class V1::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    render json: @contact, status: :created
  end

  def destroy
    @contact = Contact.where(id: params[:id]).first
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :lastname, :email)
  end

end
