class Article < ApplicationRecord
  include Searchable

  validates :title, presence: true
  validates :author, presence: true

  has_paper_trail
end
