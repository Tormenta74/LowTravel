class AddPublishStateToTravels < ActiveRecord::Migration[5.0]
  def change
    add_column :travels, :published, :boolean
  end
end
