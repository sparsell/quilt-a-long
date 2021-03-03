class Quilter < ApplicationRecord

    belongs_to :qal, optional: true #forces association 

    has_many :quilts 
   
    # accepts_nested_attributes_for :quilts
end