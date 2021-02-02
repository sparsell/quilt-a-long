class Qal < ApplicationRecord

    belongs_to :user 
    has_many :quilters #should this be 'has_many' since it has more than one quilter? (has_and_belongs_to_many, so need a join table?)
end