class Qal < ApplicationRecord

    belongs_to :user, foreign_key: "user_id"
    has_many :quilters
    has_many :quilts
    has_many :prizes 
    has_many :sponsors, through: :prizes

    accepts_nested_attributes_for :quilters, :quilts, :prizes

end
