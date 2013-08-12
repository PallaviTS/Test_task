class ServiceController < ApplicationController

  before_filter :authenticate_user!

  def twitter
   	@twitter = Twitter.user_timeline('pallavi_shastry', :count => 10)
  end

  def twitter_return
  	redirect_to :controller => "service", :action => "twitter"
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new('CAACEdEose0cBAAVfXNZAkgAZAqSqZAPRJy0WqvxSauqfZCu6DMapylTDE5AgzNFpGIqGhsTknt0YP1OGdejvWnxs6Eqo1wPZAZBD2BXKbXLrvEFZCqNdGPJLs4lza2XXDuD0EP9I81NAlWXTCP94qWK2E5QcHjSxLLiWSR2gvL4tQZDZD')  
    @results = @facebook.get_connections("me", "posts")
    link = t.first['link']
    @friends = @facebook.fql_query("SELECT friend_count FROM user WHERE uid = me()")
  end

  def block
    @name = params[:q]
    Twitter.block(@name)
    flash[:notice] = "Blocked"
    redirect_to :controller => "service", :action => "twitter"
  end

  def like
    @facebook ||= Koala::Facebook::API.new('CAACEdEose0cBAAVfXNZAkgAZAqSqZAPRJy0WqvxSauqfZCu6DMapylTDE5AgzNFpGIqGhsTknt0YP1OGdejvWnxs6Eqo1wPZAZBD2BXKbXLrvEFZCqNdGPJLs4lza2XXDuD0EP9I81NAlWXTCP94qWK2E5QcHjSxLLiWSR2gvL4tQZDZD')  
    @id = params[:post_id]
    @facebook.put_like(@id)
    redirect_to :controller => "service", :action => "facebook"
  end

  def reply
    @facebook ||= Koala::Facebook::API.new('CAACEdEose0cBAAVfXNZAkgAZAqSqZAPRJy0WqvxSauqfZCu6DMapylTDE5AgzNFpGIqGhsTknt0YP1OGdejvWnxs6Eqo1wPZAZBD2BXKbXLrvEFZCqNdGPJLs4lza2XXDuD0EP9I81NAlWXTCP94qWK2E5QcHjSxLLiWSR2gvL4tQZDZD')  
    @id = params[:post_id]
    @reply_message = params[:reply_message]
    @facebook.put_comment(@id,@reply_message)
    redirect_to :controller => "service", :action => "facebook"
  end

  def delete_post
    @id = params[:post_id]
    @delete_post = params[:delete_post]
    @facebook.delete_object(@id)    
  end

  def facebook_return
  	redirect_to :controller => "service", :action => "facebook"
  end

end
