class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :qals
    has_many :quilters, through: :qals
    has_many :sponsors, through: :qals

end