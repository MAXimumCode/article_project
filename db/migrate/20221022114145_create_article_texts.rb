class CreateArticleTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :article_texts do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
