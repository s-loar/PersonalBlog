ActiveAdmin.register Comment, as: "BlogComment" do
  permit_params :content, :blog_id, :user_id
end
