class Quilter < ApplicationRecord

    belongs_to :qal
    has_many :quilts, dependent: :destroy

    validates :quilter_name, uniqueness: true, presence: true

    accepts_nested_attributes_for :quilts


    def self.search(search)
        if search 
            qal = Qal.find_by(qal_name: search)
            if qal
                self.where(qal_id: qal)
            else
                @quilters = Quilter.all
            end
        else
            @quilters = Quilter.all
        end
    end
end