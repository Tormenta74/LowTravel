class AddSlugToTravels < ActiveRecord::Migration[5.0]
  def change
    add_column :travels, :slug, :string
    add_index :travels, :slug, unique: true
  end
end
