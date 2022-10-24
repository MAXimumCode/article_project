class AddArticleTextToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :article_texts, :article, null: false, foreign_key: true
  end
end
