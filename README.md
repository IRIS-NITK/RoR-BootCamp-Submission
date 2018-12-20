The tasks are completed using the application built from the third session of the RoR bootcamp. Thus, all the tables and configurations are assumed to be present.

To add and use the required gems in the RoR application, the following steps are to be performed:

> Add these lines to your Gemfile:

	# Gems required for assignment:
	# Date-Time picker
	gem 'bootstrap-datepicker-rails'
	# Color picker
	gem 'bootstrap-colorpicker-rails', '~> 0.4.0'

> Run 'bundle install' in the root directory of the app using the terminal.

> Add these lines to your ./app/assets/javascripts/application.js file, above `//= require_tree .`:

	//= require bootstrap-datepicker
	//= require bootstrap-colorpicker

> Add these lines to your ./app/assets/stylesheets/application.css file, above `*= require_tree . `:

	*= require bootstrap-datepicker
	*= require bootstrap-colorpicker

* * *

Task 1:

> To show a Date and Time picker for the application, insert the field in the _form.html.erb file, below any field of your choice.

	  <div class="field">
	    <%= form.label :completion_date %>
	    <%= form.datetime_field :completion_date %>
	  </div>

> Add the parameter `completion_date` to `params.require()` under `todo_list_params` in the controller file. 

> Update the database by adding a migration as follows:

	rails generate migration add_completion_date_to_todo_lists completion_date:date_time

> Run the migrations using `rake db:migrate`

> Finally, run `rails server` and now you can see a Date and Time Picker when creating a new To-Do list.

> When viewing the task, to see the expected and actual date of completion, along with completion status, add this to the show.html.erb file:

	<p>
	  <strong>Expected date of Completion:</strong>
	  <%= @todo_list.completion_date %>
	</p>

	<p>
	  <strong>Actual date of Completion:</strong>
	  <%= @todo_list.completed_at %>
	</p>

	<p>
	  <strong>Whether completed on time?:</strong>
	  <%= @todo_list.completed_on_time? %>
	</p>

* * *

Task 2:

> To show a Color picker for the application, insert the field in the _form.html.erb file, below any field of your choice.

	  <div class="field">
	    <%= form.label :color %>
	    <%= form.color_field :color %>
	  </div>

> Add the parameter `color` to `params.require()` under `todo_list_params` in the controller file. 

> Update the database by adding a migration as follows:

	rails generate migration add_color_to_todo_lists color:string

> Run the migrations using `rake db:migrate`

> To add the corresponding colour for each item in the to-do list, modify the second row tag of the table in to include the attribute:

	style="color:<%= todo_list.color %>;"

> Finally, run `rails server` and now you can see the color of each item in the to-do list.

* * *

Task 3:

> To indicate whether the user has completed a task on time, we compare it to the date and time he marks the list as complete.

> First, create a model for the same in ./models/todo_list.rb by adding the following lines:

    def completed_on_time?
            if completed?
              completion_date.utc > completed_at.utc ? 'Yes' : 'No'
            else
              'Not yet completed'
            end

> Next, add the appropriate table header and elements by adding the following lines respectively in index.html.erb:
    
    <th>Completed On Time?</th>

    <td><%= todo_list.completed_on_time? %></td>

> Run `rails server` and now there will be an additional field that shows the status of the completion of each task.

* * *
Task 4:
    
> To add styling to the web page (with references from [this link](https://medium.com/@deallen7/how-to-build-a-todo-app-in-rails-e6571fcccac3))

> First, rename the main application.css file to application.scss (Sass)

> Next, copy the contents of the [file](https://github.com/mackenziechild/Todo-App/blob/master/app/assets/stylesheets/application.css.scss) to your respective application.scss.

> Update all the .html.erb files wherever possible by following the reference. (Color, text and sizes have been tweaked on my own. The table is also of my design)

> Run `rails server` and now you will be able to see a more intuitive-looking page.
