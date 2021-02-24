class Qal < ApplicationRecord

    belongs_to :user, foreign_key: "user_id"

    has_many :quilters

    # ?? Does the below work? 
    has_many :quilts, through: :quilters

    has_many :prizes 
    has_many :sponsors, through: :prizes

end
