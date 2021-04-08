Specs:

 [x] Using Ruby on Rails for the project
 [x] Include at least one has_many relationship 
        (x has_many y)
        - User has_many QALs
        - QAL has_many Quilters
        - Quilter has_many Quilts
        
 [x] Include at least one belongs_to relationship 
        (x belongs_to y)
        - QAL belongs_to User
        - Quilt belongs_to Quilter
        <!-- - Quilter belongs_to QAL SHOULD THIS BE HAS MANY THROUGH W. A JOIN TABLE? -->

 [x] Include at least two has_many through relationships 
        (x has_many y through z) 
        - QAL has_many Quilts through Quilter
        - User has_many Quilters through QAL

 [x] Include at least one many-to-many relationship 
        (x has_many y through z, y has_many x through z)
        - QAL has_many Sponsors through Prizes
        - Sponsor has_many QALs through Prizes

 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user                
        - prize_name :string

 [x] Include reasonable validations for simple model objects 
        ()

 [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature 
        - @good_for_beginners = qals where skill_level: beginner
        - @finished_quiltsL: /qals/quilts where 'is_finished? == 'true'

 [x] Include signup
 [x] Include login
 [x] Include logout
 [x] Include third party signup/login (how e.g. OmniAuth - Google)
 [x] Include nested resource show or index 
       - (URL e.g. qals/2/prizes)

 [x] Include nested resource "new" form 
       - (URL quilter/:id/quilts/new)
       
 [x] Include form display of validation errors 
    (/prize/new)
    (/prize/edit)


Confirm:

 [x] The application is pretty DRY
 [x] Limited logic in controllers
 [x] Views use helper methods if appropriate
 [x] Views use partials if appropriate