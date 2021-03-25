class Sponsor < ApplicationRecord

    has_many :prizes
    has_many :qals, through: :prizes

    accepts_nested_attributes_for :prizes
    accepts_nested_attributes_for :qals
end
