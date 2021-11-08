class User < ApplicationRecord
    has_many_attached :files
    has_many :contacts
    
    has_secure_password

    before_save { self.email = email.downcase }
end
