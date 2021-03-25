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

<div class="qal-form-section">
        <%= f.label :quilter_name, "Prizes:" %>
            <div>
                <%= f.collection_check_boxes :prize_ids, Prize.all, :id, :prize_name %>
            </div>

        <h4><%= f.label "Or Add a New Prize:" %></h4>
            <%= f.fields_for :prizes do |build_prize|%>
                <p><%= build_prize.label :prize_name %></p>
                <p><%= build_prize.text_field :prize_name %></p>
                <p><%= build_prize.label :sponsor_name, "Sponsored by:" %>
            
                <% end %> 
    </div>

Removed from quilter New
    <%# has_many %>
    <div class="new-quilt">
   <%= f.fields_for :quilts do |quilt_builder|%>
       

        <p><%= quilt_builder.label :quilt_name %>
        <%= quilt_builder.text_field :quilt_name %></p>

        <p><%= quilt_builder.label "Is it Finished?" %>
        <%= quilt_builder.select :is_finished, options_for_select([['Yes', 'Yes'], ['No', 'No']]) %></p>

        <% end%>
        </div>
    
    Removed from QAL:
    <div class="qal-form-section">
        <h4><%= f.label :quilter_name, "Choose your quilters:" %></h4>
            <div>
                <%= f.collection_check_boxes :quilter_ids, Quilter.all, :id, :quilter_name %>
                <%# <%= f.collection_select :name, User.all, :name, :name %>
            </div>

        <h4><%= f.label "Or Add a New Quilter:" %></h4>
            <%= f.fields_for :quilters do |build_quilter|%>
                <p><%= build_quilter.label :quilter_name %></p>
                <p><%= build_quilter.text_field :quilter_name %></p>
                <% end %> 
    </div>

    <div class="qal-form-section">
        <%= f.label :prize_name, "Prizes:" %>
            <div>
                <%= f.collection_check_boxes :prize_ids, Prize.all, :id, :prize_name %>
            </div>

        <h4><%= f.label "Or Add a New Prize:" %></h4>
            <%= f.fields_for :prizes do |build_prize|%>
                <p><%= build_prize.label :prize_name %></p>
                <p><%= build_prize.text_field :prize_name %></p>
            
                <% end %> 
    </div>