class User < ApplicationRecord
    has_secure_password

    has_many :patterns
    has_many :qals
    has_many :quilters, through: :qals

end