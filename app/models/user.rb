class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :qals, dependent: :destroy
    has_many :quilters, through: :qals

    accepts_nested_attributes_for :qals

    def self.create_from_google(auth)
        #find or create a user by given info (name, email, etc.)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
            user.email = auth['info']['email']
            user.password = SecureRandom.hex(12)
        end
    end

    def self.create_from_github(auth)
        User.find_or_create_by(email: auth['info']['email']) do |user|
            user.password = SecureRandom.hex(12)
            if user
                redirect_to user
            else
                redirect_to root_path
            end
        end
    end

end