class HomeController < ApplicationController
  # load_and_authorize_resource
  def index
    @groups = Group.all.includes(:user)
  end
end
