class Prize < ApplicationRecord

    belongs_to :sponsor
    belongs_to :qal

    validates :prize_name, presence: :true
    
end
