class ClientContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = ClientContact.all.order(id: :desc)
  end

  def show
    @jobs = Job.where(client_contact_id: @contact.id)
  end

  def new
    @contact = ClientContact.new
  end

  def create
    @contact = Client.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to client_contact_path(@contact), notice: "Client was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to client_contact_path(@contact), notice: "Job was updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    redirect_to client_contacts_path
  end

  private

  def set_contact
    @contact = ClientContact.find(params[:id])
  end

  def contact_params
    params.require(:client_contact).permit(:first_name, :last_name, :client, :position, :status, :phone_number, :email)
  end
end
