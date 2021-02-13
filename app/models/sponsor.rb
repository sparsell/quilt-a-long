class Sponsor < ApplicationRecord

    has_many :qals
    has_many :users, through: :qals
end
