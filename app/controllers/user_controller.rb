	class UserController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
	    @facebook ||= Koala::Facebook::API.new('CAACEdEose0cBACf74qX6YhtNDAmYKGhcArMOMBLADOgLDHOm2XDXCIZAZCZBCyGmkWBCZBvGAle6AohsQrYLEaiJZAyy0xlSaiPrS7ClIzkyZCJEhZChQA1nwz6ZAMSPYgZBomAKN3ebbzPeOHOXQEmAYKELUsYztN3bnoNcQj1ZBgOwZDZD')  
	    @notification = @facebook.fql_query("SELECT is_unread FROM notification WHERE recipient_id = me()").first
  		@not = @notification['is_unread']
  	end

 	def landing
  		render :dashboard
 	end
end
