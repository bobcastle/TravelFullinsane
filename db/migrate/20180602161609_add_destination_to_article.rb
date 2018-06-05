class AddDestinationToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :destination, :string
  end
end
