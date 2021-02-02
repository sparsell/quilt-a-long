class Quilter < ApplicationRecord

    has_many :qals #should this be 'has_many' since it has more than one quilter? (has_and_belongs_to_many, so need a join table?)
    has_many :users, through: :qals
    has_many :patterns, through: :qals


end