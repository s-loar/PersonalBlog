ActiveAdmin.register Comment, as: "BlogComment" do
  controller do
    def destroy
      @comment = Comment.find(params[:id])
      @comment.discard
      redirect_to admin_blogs_comments_path
    end
  end

  permit_params :content, :blog_id, :user_id
end
