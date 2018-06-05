class AddBudgetToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :budget, :integer
  end
end
