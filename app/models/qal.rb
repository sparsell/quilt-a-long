class Qal < ApplicationRecord

    belongs_to :user 
    has_many :quilters
    has_many :sponsors 
    has_many :quilts
end