class UserController < ApplicationController
  def dashboard
  end
  def landing
  	render :dashboard
  end
end
