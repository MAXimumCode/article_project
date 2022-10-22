class Article < ApplicationRecord
  has_many :article_texts, dependent: :destroy
end
