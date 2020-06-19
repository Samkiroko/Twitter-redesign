module OpinionsHelper
  def following_opinions
    @opinions = Opinion.following_opinions(current_user)
  end
end
