class UsersController < ApplicationController
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end
  def show
    the_id = params.fetch("username")
    @user = User.where({:username => the_id }).at(0)

    render({ :template => "users/show" })
  end
  def create
    @user = User.new
    @user.username = params.fetch("query_name")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "Department created successfully." })
    else
      redirect_to("/users", { :notice => "Department failed to create successfully." })
    end
  end
  def update
    the_id = params.fetch("path_id")
    @user = User.find(the_id)

    @user.username = params.fetch("query_name")
    @user.save
    redirect_to("/users/#{@user.username}", { :notice => "Actor updated successfully."} )
  end
end
