class Users::ContactsController < ApplicationController
    require 'csv'
    require 'matrix'

    def new
        @title = "Import Contacts"

        @user = current_user
        @file_data
    end

    def upload
        @title = "Import Contacts"

        

        @file_data = params[:csv_file]
        @user = current_user

        return redirect_to  @user , notice: "Any file loaded" if @file_data.nil?

        @user.files.attach(@file_data)
        
        @file_name = @file_data.original_filename
        @csv_headers = CSV.open(@file_data.path).each.first
    end

    def import
        @user = current_user
        @file_data = session[:file_data]

        @csv_file = @user.files.last.download
        @csv_matrix = CSV.parse(@csv_file.tr("\n","\r"), headers: :first_row).map(&:to_h)

        @csv_matrix.each do |item|
            @contact = User::Contact.new

            next if item[params[:name]].nil?

            @contact.name = item[params[:name]]
            @contact.birth = item[params[:birth]] 
            @contact.phone = item[params[:phone]]
            @contact.address = item[params[:address]]
            @contact.credit_card = item[params[:credit_card]]
            @contact.franchise = item[params[:franchise]]
            @contact.email = item[params[:email]]
    
            @user.contacts << @contact
        end
    
        @user.save!

        redirect_to current_user
    end
end
