class AddDeleteByToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :deleted_by
  end
end
