Error messages:
[] For incorrect login, etc.
[] Use partial or other? 

Associations:
   User -- QAL -- Quilter
   - many_to_many
   - does QAL need to 'belong_to :quilter'
   - right now, it has_many :quilters
   [] Can User see Quilts as currently set up?
    - Users have_many :quilters through: :Qals, quilters have_many :quilts

Style TODOs:
[x] move logo attribution to footer (can I use it w/out attribution right below the icon?) 
[] add attribution link: hyperlinked to original source or use: thenounproject.com  
[x] remove/hide nav bar on home page
[x] Get FAQ, About and charlie pops IG links to work properly
[] Spacing of footer contents (centering attribution, padding on R, L)

[x] if logged in? show navigation that can look at quilters and QALs (not signup/login)




      <% if logged_in? %>
              <p> Logged in as: <%= current_user.name %> </p>
              <% else %>
          <% end %>

      <% if current_user(user) %>
        <%= link_to "Delete", user, method: :delete, data: { confirm: "Are you sure?" } %>
        <% end %>

        <%= f.label "Quilt Style" %>
<%= f.select :quilting_style, %>
<%= f.text_field :quilting_style, class: 'form-control' %>
<br>


<%= f.label "Add Prizes" %><br>
<%= f.fields_for :prizes do |f|%>
        <%= f.label :prize_name %>
        <%= f.collection_select :prize_name, Prize.all, :prize_name, :prize_name %>
    <% end%>
    <br>
    <%= link_to "Add New Prize", new_prize_path %><br>
    Sponsored by (add Sponsor here) <%= %>
<br>

<div>
        <%= f.label "Add a Quilt:" %><br>
        <%= f.fields_for :quilt do |build_quilt| %>
            <%= build_quilt.label :quilt_name %>
            <%= build_quilt.text_field :quilt_name %>
            <br>
           
        <% end %>
    </div>

    