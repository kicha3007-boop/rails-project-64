require "test_helper"

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:two)
      @post = posts(:one)
      @attrs = { content: Faker::Lorem.sentence }
    end

    test "#create" do
      sign_in @user
      post post_comments_path(@post), params: { post_comment: @attrs }

      comment = @post.comments.find_by(content: @attrs[:content])

      assert { comment }
      assert { comment.user == @user }
      assert { comment.is_root? }
      assert_redirected_to post_path(@post)
    end

    test "#create reply" do
      parent = post_comments(:with_comments)
      sign_in @user
      post post_comments_path(@post), params: { post_comment: @attrs.merge(parent_id: parent.id) }

      comment = @post.comments.find_by(content: @attrs[:content])

      assert { comment.parent == parent }
    end

    test "#create by guest" do
      post post_comments_path(@post), params: { post_comment: @attrs }

      assert_redirected_to new_user_session_path
      assert { !PostComment.exists?(content: @attrs[:content]) }
    end
  end
end
