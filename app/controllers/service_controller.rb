class ServiceController < ApplicationController

  def twitter
 	@twitter = Twitter.user_timeline('pallavi_shastry', :count => 10)
  end

  def twitter_return
  	redirect_to :controller => "service", :action => "twitter"
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new('CAATiHqRAthIBAFHwnpB0pnvzl3HTjArUwJU3KZAdarbWPp8MyJYf9xW6FHjiR3jbD8767iRxhFqpmUZCPpsccZB1ctpZBJ9JHh2w5hHr5I8WgbGTRiz93SAX5KVbLzm8ZC3ZBil00zgllUDu8gdi8w4EjBBXdbrExkfCKZBGfgHWwZDZD')  
    @results = @facebook.get_connections("me", "posts")
  end

  def like
    @facebook ||= Koala::Facebook::API.new('CAATiHqRAthIBAFHwnpB0pnvzl3HTjArUwJU3KZAdarbWPp8MyJYf9xW6FHjiR3jbD8767iRxhFqpmUZCPpsccZB1ctpZBJ9JHh2w5hHr5I8WgbGTRiz93SAX5KVbLzm8ZC3ZBil00zgllUDu8gdi8w4EjBBXdbrExkfCKZBGfgHWwZDZD')  
    @facebook.first.put_like('')  
  end

  def reply
    
  end
  
  def facebook_return
  	redirect_to :controller => "service", :action => "facebook"
  end

end
