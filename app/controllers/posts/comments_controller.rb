module Posts
  class CommentsController < ApplicationController
    def create
      @comment = resource_post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to post_path(resource_post), notice: t(".success")
      else
        redirect_to post_path(resource_post), alert: @comment.errors.full_messages.to_sentence
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
