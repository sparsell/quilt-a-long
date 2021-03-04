Specs:

 [x] Using Ruby on Rails for the project
 [x] Include at least one has_many relationship 
        (x has_many y)
        - User has_many QALs
        - QAL has_many Quilters
        - Quilter has_many Quilts [don't need this]
        
 [x] Include at least one belongs_to relationship 
        (x belongs_to y)
        - QAL belongs_to User
        - Quilter belongs_to QAL
        - Quilt belongs_to Quilter [don't need this]

 [x] Include at least two has_many through relationships 
        (x has_many y through z) 
        - QAL has_many Quilts through Quilter
        - User has_many Quilters through QAL
        - User has_many Sponsors through QAL

 [x] Include at least one many-to-many relationship 
        (x has_many y through z, y has_many x through z)
        - QAL has_many Sponsors through Prizes
        - Sponsor has_many QALs through Prizes

 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user                
        - prize_name :string

 [] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

 [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature 
       - User.most_quilters URL: /users/most_quilters, or QAL.most_sponsors)

 [x] Include signup
 [x] Include login
 [x] Include logout
 [] Include third party signup/login (how e.g. OmniAuth - Google)
 [] Include nested resource show or index 
       - (URL e.g. qals/2/quilters)

 [] Include nested resource "new" form 
       - (URL e.g. recipes/1/ingredients/new, qal/1/prizes/new)
       
 [] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

 [] The application is pretty DRY
 [] Limited logic in controllers
 [] Views use helper methods if appropriate
 [] Views use partials if appropriate