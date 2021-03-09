class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :qals, dependent: :destroy
    has_many :quilters, through: :qals

    accepts_nested_attributes_for :qals

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end

    def self.find_or_create_from_github(auth)
       
        User.find_or_create_by(email: auth['info']['email']) do |user|
            # user.name = auth['info']['name']
            user.password = SecureRandom.hex(12)
            if user
                redirect_to user
            else
                redirect_to root_path
            end
        end
    end

end