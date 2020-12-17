ActiveAdmin.register Comment, as: "BlogComment" do
  controller do
    def destroy
      @comment = Comment.find(params[:id])
      @comment.update(deleted_by: current_user)
      @comment.discard
      redirect_to admin_blogs_comments_path
    end
  end

  action_item :restore, only: :show do
    link_to "Restore Comment", restore_admin_blogs_comment_path(blogs_comment), method: :put if blogs_comment.user.undiscarded? && blogs_comment.discarded?
  end

  member_action :restore, method: :put do
    @comment = Comment.find(params[:id])
    @comment.update(deleted_by: nil)
    @comment.undiscard
    redirect_to admin_blogs_comments_path
  end

  permit_params :content, :blog_id, :user_id
end
