class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jb'



    if params[:search]
      @contacts = @contacts.where("first_name iLike ?", "%#{params[:search]}")
    end
  end

  def create
    @contact = Contact.new(
    first_name: params[:first_name], 
    middle_name: params[:middle_name], 
    last_name: params[:last_name], 
    phone: params[:phone], 
    email: params[:email],
    user_id: 1
    )

    if @contact.save
      render 'show.json.jb'
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    # @contact.full_name = params[:full_name] || @contact.full_name
    @contact.phone = params[:phone] || @contact.phone
    @contact.email = params[:email] || @contact.email
  
    
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy

    @contact = Contact.find_by(id: params[:id])
    @contact.destroy

    render json: {message: "Contact destroyed."}


  end

end
