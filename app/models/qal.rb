class Qal < ApplicationRecord

    belongs_to :user
    has_many :quilters
    has_many :quilts
    has_many :prizes 
    has_many :sponsors, through: :prizes

    accepts_nested_attributes_for :quilters 
    accepts_nested_attributes_for :quilts
    accepts_nested_attributes_for :prizes
    accepts_nested_attributes_for :sponsors

end
