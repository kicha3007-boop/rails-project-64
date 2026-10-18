module Posts
  class LikesController < ApplicationController
    def create
      resource_post.likes.find_or_create_by!(user: current_user)

      redirect_to post_path(resource_post)
    end

    def destroy
      like = resource_post.likes.find_by(id: params[:id], user: current_user)
      like&.destroy

      redirect_to post_path(resource_post)
    end
  end
end
