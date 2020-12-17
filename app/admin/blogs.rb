ActiveAdmin.register Blog do
  controller do
    def destroy
      @blog = Blog.friendly.find(params[:id])
      @blog.update(deleted_by: current_user)
      @blog.discard
      redirect_to admin_blogs_path
    end
  end

  action_item :restore, only: :show do
    link_to "Restore Blog", restore_admin_blog_path(blog), method: :put if blog.user.undiscarded? && blog.discarded?
  end

  member_action :restore, method: :put do
    @blog = Blog.friendly.find(params[:id])
    @blog.update(deleted_by: nil)
    @blog.undiscard
    redirect_to admin_blogs_path
  end

  permit_params :title, :body, :user_id
end
