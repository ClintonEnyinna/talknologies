module LikesHelper
  def like_or_dislike(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)
    if like
      link_to opinion_like_path(id: like, opinion_id: opinion.id), method: :delete, remote: :true, class: "text-decoration-none text-muted" do
        icon("fas", "heart", class: "pr-1")
      end
    else
      link_to opinion_likes_path(opinion), method: :post, remote: :true, class: "text-decoration-none text-muted" do
        icon("far", "heart", class: "pr-1")
      end
    end
  end

  def num_of_likes(opinion)
    Like.all.where(opinion: opinion).count
  end
end
