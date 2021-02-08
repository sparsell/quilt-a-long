Associations:
    Does a quilter have many QALs or belongs to many? (They can have more than one)

Style TODOs:
[x] move logo attribution to footer (can I use it w/out attribution right below the icon?) 
[] add attribution link: hyperlinked to original source or use: thenounproject.com  
[] remove/hide nav bar on home page
[x] Get FAQ, About and charlie pops IG links to work properly
[] Spacing of footer contents (centering attribution, padding on R, L)

[] if logged in? show navigation that can look at quilters and QALs (not signup/login)

Nav:
<nav>
            <ul class="navbar navbar-nav navbar-right">
                <li class="navbar-brand"> <%= link_to "Home", root_path %></li>
                <li class="navbar-brand"> <%= link_to "Sign Up", signup_path %></li>
                <li class="navbar-brand"> <%= link_to "Log In", login_path %></li>
            </ul>
        </nav>
