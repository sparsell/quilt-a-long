Specs:

 [x] Using Ruby on Rails for the project
 [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Qals)
 [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Qal belongs_to User)
 [x] Include at least two has_many through relationships (x has_many y through z; e.g. QAL has_many Quilts through Quilters)
 [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. User has_many Quilters through Qals, Quilter has_many Users through Qals)
 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. qal.quilt_style or quilt.is_finished)
 [] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature (e.g.  User.most_quilters URL: /users/most_quilters, QAL.most_sponsors))
 [x] Include signup
 [x] Include login
 [x] Include logout
 [] Include third party signup/login (how e.g. OmniAuth - Google)
 [] Include nested resource show or index (URL e.g. quilters/2/qals)
 [] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new, qal/1/quilters/new)
 [] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

 [] The application is pretty DRY
 [] Limited logic in controllers
 [] Views use helper methods if appropriate
 [] Views use partials if appropriate