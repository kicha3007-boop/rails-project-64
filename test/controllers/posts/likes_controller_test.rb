require "test_helper"

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
      @post = posts(:one)
    end

    test "#create" do
      sign_in @user
      post post_likes_path(@post)

      assert { @post.likes.exists?(user: @user) }
      assert_redirected_to post_path(@post)
    end

    test "#create twice keeps one like" do
      sign_in @user
      post post_likes_path(@post)
      post post_likes_path(@post)

      assert { @post.likes.where(user: @user).count == 1 }
    end

    test "#destroy" do
      like = post_likes(:one)
      sign_in users(:two)
      delete post_like_path(@post, like)

      assert { !PostLike.exists?(like.id) }
      assert_redirected_to post_path(@post)
    end

    test "#destroy someone else's like" do
      like = post_likes(:one)
      sign_in @user
      delete post_like_path(@post, like)

      assert { PostLike.exists?(like.id) }
    end

    test "#create by guest" do
      post post_likes_path(@post)

      assert_redirected_to new_user_session_path
    end
  end
end
