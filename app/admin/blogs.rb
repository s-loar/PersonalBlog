ActiveAdmin.register Blog do
  controller do
    def destroy
      @blog = Blog.friendly.find(params[:id])
      @blog.discard
      redirect_to admin_blogs_path
    end
  end

  permit_params :title, :body, :user_id
end
