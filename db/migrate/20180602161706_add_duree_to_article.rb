class AddDureeToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :duree, :integer
  end
end
