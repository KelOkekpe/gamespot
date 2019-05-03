class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category

    scope :by_category, -> (branch, category_name) do
    joins(:category).where(categories: {name: category_name, branch: branch})
  end

  scope :by_branch, -> (branch) do
    joins(:category).where(categories: {branch: branch})
  end
end
