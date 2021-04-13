class Qal < ApplicationRecord

    belongs_to :user
    has_many :quilters, dependent: :destroy
    has_many :quilts, dependent: :destroy

    has_many :prizes, dependent: :destroy
    has_many :sponsors, through: :prizes

    validates :qal_name, presence: true, uniqueness: true

    accepts_nested_attributes_for :prizes
    accepts_nested_attributes_for :quilters
    accepts_nested_attributes_for :quilts


    scope :beginner, -> {where(skill_level: 'Beginner')}
    scope :ending_soon, -> { order(:end_date, :desc) }
    scope :finished_quilts, -> {includes(:quilts).where(quilts: {is_finished: true})}
end
