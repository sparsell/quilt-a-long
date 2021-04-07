class Sponsor < ApplicationRecord

    has_many :prizes, dependent: :destroy
    has_many :qals, through: :prizes

    accepts_nested_attributes_for :prizes
    accepts_nested_attributes_for :qals

    validates :sponsor_name, uniqueness: :true, presence: true

end
