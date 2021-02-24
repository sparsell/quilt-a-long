class Quilter < ApplicationRecord

    # validates :quilter_name, :uniqueness, true

    belongs_to :qal, foreign_key: "qal_id" 
    has_many :quilts
   
    def qal_name=(name)
        self.qal = Qal.find_or_create_by(qal_name: qal_name)
      end
    
      def qal_name
         self.qal ? self.qal.qal_name : nil
      end

end