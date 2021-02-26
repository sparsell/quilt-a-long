class Quilt < ApplicationRecord

    belongs_to :qal
    belongs_to :quilter
   
    def qal_name
        self.qal ? self.qal.qal_name : nil
     end

    def qal_name=(name)
        self.qal = Qal.find_or_create_by(qal_name: qal_name)
      end

      def quilter_name  
        self.quilter ? self.quilter.quilter_name : nil
     end

      def quilter_name=(name)
        self.quilter = Quilter.find_or_create_by(quilter_name: quilter_name)
      end
    
     

end