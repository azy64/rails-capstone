class UsersController < ApplicationController
  load_and_authorize_resource
  def index; end

  def show
    redirect_to groups_path
  end

  def create; end

  def destroy; end
end
