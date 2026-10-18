require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @attrs = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: 300),
      category_id: categories(:development).id
    }
  end

  test "#index" do
    get root_path

    assert_response :success
    assert { response.body.include?(@post.title) }
  end

  test "#show" do
    get post_path(@post)

    assert_response :success
    assert { response.body.include?(posts(:one).comments.first.content) }
  end

  test "#new requires authentication" do
    get new_post_path

    assert_redirected_to new_user_session_path
  end

  test "#new" do
    sign_in @user
    get new_post_path

    assert_response :success
  end

  test "#create" do
    sign_in @user
    post posts_path, params: { post: @attrs }

    post = Post.find_by(title: @attrs[:title])

    assert { post }
    assert { post.creator == @user }
    assert_redirected_to post_path(post)
  end

  test "#create with invalid data" do
    sign_in @user
    post posts_path, params: { post: @attrs.merge(body: "") }

    assert_response :unprocessable_entity
    assert { !Post.exists?(title: @attrs[:title]) }
  end

  test "#create by guest" do
    post posts_path, params: { post: @attrs }

    assert_redirected_to new_user_session_path
    assert { !Post.exists?(title: @attrs[:title]) }
  end
end
