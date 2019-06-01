module Posts
  class RenderPosts

    def show_posts
      @posts = Post.offset(rand(Post.count)).limit(5) #this shows 5 random posts
    end


  end
end
