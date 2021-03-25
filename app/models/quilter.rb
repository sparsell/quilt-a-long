class Quilter < ApplicationRecord

    belongs_to :qal
    has_many :quilts 

    validates :quilter_name, uniqueness: true, presence: true

   
    accepts_nested_attributes_for :quilts
end