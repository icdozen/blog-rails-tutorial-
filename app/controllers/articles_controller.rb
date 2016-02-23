class ArticlesController < ApplicationController
  #To manually define an action inside a controller, all you need to do is to define a new method inside the controller
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end

  def new
  end

 def create
  @article = Article.new(params[:article])
 
  @article.save
  redirect_to @article
end
# Here's what's going on: every Rails model can be initialized with its respective attributes, 
# which are automatically mapped to the respective database columns. 
# In the first line we do just that (remember that params[:article] contains 
# the attributes we're interested in). 
# Then, @article.save is responsible for saving the model in the database. 
# Finally, we redirect the user to the show action, which we'll define later.

  # The render method here is taking a very simple hash with a key of plain and value of params[:article].inspect. The params method is the object which represents the parameters (or fields) coming in from the form. The params method returns an ActiveSupport::HashWithIndifferentAccess object, which allows you to access the keys of the hash using either strings or symbols. In this situation, the only parameters that matter are the ones from the form.
end

# Ensure you have a firm grasp of the params method, 
# as you'll use it fairly regularly. 
# Let's consider an example URL: http://www.example.com/?username=dhh&email=dhh@email.com. 
# In this URL, params[:username] would equal "dhh" and params[:email] would equal "dhh@email.com".