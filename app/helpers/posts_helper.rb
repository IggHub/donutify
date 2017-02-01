module PostsHelper
  def star_rating(rating, star, half_star)
    star = star
    half_star = half_star
    if ((rating % 1).round == 1) #ends with 0.5
      result = (rating - 0.5).round * star
    else
      result = rating * star + half_star
    end
    return result
  end
end
