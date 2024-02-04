class Article < ApplicationRecord
  after_destroy :ensure_article_count

  private

  def ensure_article_count
    return unless Article.count < 10

    # Note that the following line calls the top-level `Faker` module:
    Article.create(title: Faker::Book.title, content: Faker::Lorem.paragraph)
  end
end
