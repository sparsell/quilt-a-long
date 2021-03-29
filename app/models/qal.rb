class Qal < ApplicationRecord

    belongs_to :user
    has_many :quilters, dependent: :destroy
    has_many :quilts

    has_many :prizes 
    has_many :sponsors, through: :prizes

    validates :qal_name, presence: true, uniqueness: true

    scope :qals_with_finished_quilts, -> {joins(:quilts).where('quilts.is_finished = true')}

    # scope :@qals_with_most_quilters, -> {joins (:quilters).where('quilters.count= ')}
end
