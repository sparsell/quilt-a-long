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

      # accepts_nested_attributes_for :quilts

      def quilts=(quilt_name)
        quilt_name.each do |quilt_name|
          unless quilt_name.empty?
          self.quilts << Quilt.create(quilt_name: quilt_name, is_finished: is_finished)
          self.save
          end
        end
      end

end