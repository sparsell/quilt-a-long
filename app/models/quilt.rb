class Quilt < ApplicationRecord

    belongs_to :qal, optional: true #forces association
    belongs_to :quilter, optional: true #forces association

end