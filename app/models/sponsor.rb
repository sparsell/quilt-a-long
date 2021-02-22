class Sponsor < ApplicationRecord

    has_many :prizes
    has_many :qals, through: :prizes
end
