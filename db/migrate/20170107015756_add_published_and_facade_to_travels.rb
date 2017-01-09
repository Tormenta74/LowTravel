class AddPublishedAndFacadeToTravels < ActiveRecord::Migration[5.0]
  def change
    add_column :travels, :published_at, :datetime
    add_column :travels, :facade, :string
  end
end
