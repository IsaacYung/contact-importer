class Users::ContactsController < ApplicationController
    require 'csv'
    require 'matrix'

    def new
        @title = "Import Contacts"
        @user = current_user
        @file_data
    end

    def upload
        @file_data = params[:csv_file]
        # redirect_to users_contacts_new_path
        @title = "Import Contacts"
        @user = current_user

        @user.files.attach(@file_data)
        
        @file_name = @file_data.original_filename
        @csv_headers = CSV.open(@file_data.path).each.first
    end

    def import
        @user = current_user
        @file_data = session[:file_data]

        @csv_file = @user.files.last.download
        @csv_matrix = CSV.parse(@csv_file.tr("\n","\r"))

        @contact = User::Contact.new
    end
end
