class ServiceController < ApplicationController
  def twitter
  	# Twitter.user_timeline()
  	@twitter = Twitter.user_timeline('pallavi_shastry', :count => 10)
  	
  end

  def twitter_return
  	redirect_to :controller => "service", :action => "twitter"
  end

  def facebook
  end
end
