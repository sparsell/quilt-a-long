Associations:
    Does a quilter have many QALs or belongs to many? (They can have more than one)

    <!DOCTYPE html>
<html>
  <head>
    <title> <%= yield(:title) %> | Quilt-A-Long App</title>

    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>

  <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>