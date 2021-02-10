class Quilter < ApplicationRecord

    has_many :quilts
    has_many :qals 
    has_many :users, through: :qals


end