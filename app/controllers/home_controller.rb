class HomeController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token

  def index
  	@title = 'Home Page'
  	@main_header = 'Home'
  	@items = Item.all
  end

  def new
  	@title = 'Create Page'
  	@main_header = 'Create'
  end

  def create
  	item = Item.new(:name => params[:name])
  	puts item.id
  	item.save!
  	redirect_to home_path
  end

  def edit
  	@item = Item.first(:id => params[:id])
  	@title = @item.name
  	@main_header = @item.name
  end

  def update
  	item = Item.first(:id => params[:id])
  	item.name = params[:name]
  	item.save
  	redirect_to home_path
  end

  def remove
  	item = Item.first(:id => params[:id])
  	item.destroy
  	redirect_to home_path
  end
end