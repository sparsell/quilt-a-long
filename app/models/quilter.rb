class Quilter < ApplicationRecord

    belongs_to :qal
    has_many :quilts, dependent: :destroy

    validates :quilter_name, uniqueness: true, presence: true

    accepts_nested_attributes_for :quilts

    # scope :quilters_with_finished_quilts, -> {joins(:quilts).where('quilts.is_finished = true')}
end