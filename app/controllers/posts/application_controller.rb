module Posts
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!

    private

    def resource_post
      @resource_post ||= Post.find(params[:post_id])
    end
  end
end
