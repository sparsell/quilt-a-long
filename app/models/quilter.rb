class Quilter < ApplicationRecord

    belongs_to :qal, optional: true #forces association 
    has_many :quilts 

    validates :quilter_name, uniqueness: true
   
    accepts_nested_attributes_for :quilts
end