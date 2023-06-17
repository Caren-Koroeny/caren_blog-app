<%= form_with(model: @post, url: user_posts_path(user_id: current_user.id), class: 'post-form') do |form| %>
    <h2>Add User Post</h2>
    <div class="form-group">
      <%= form.label :title %>
      <%= form.text_field :title, placeholder: 'Enter your title', class: 'form-control' %>
    </div>
  
    <div class="form-group">
      <%= form.label :text %>
      <%= form.text_field :text, placeholder: 'Enter your text', class: 'form-control' %>
    </div>
  
    <div class="form-group">
      <%= form.label :comments_counter %>
      <%= form.number_field :comments_counter, placeholder: 'Enter number of comments', class: 'form-control' %>
    </div>
  
    <div class="form-group">
      <%= form.label :likes_counter %>
      <%= form.number_field :likes_counter, placeholder: 'Enter number of likes', class: 'form-control' %>
    </div>
  
    <div class="form-group">
      <%= form.submit "Create Post", class: 'btn btn-primary' %>
    </div>
  <% end %>