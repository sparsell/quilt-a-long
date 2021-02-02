class Pattern < ApplicationRecord

    belongs_to :user
    belongs_to :qals
    has_many :quilters #many quilters can have the same pattern

end