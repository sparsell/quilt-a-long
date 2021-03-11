class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :qals, dependent: :destroy
    has_many :quilters, through: :qals

    accepts_nested_attributes_for :qals
      
end