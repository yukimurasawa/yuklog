class Article < ApplicationRecord
  enum tag: {report: 1, event: 2, interview: 3, info: 4}

  ALLOWED_PARAMS = [:id, :title, :tag, :text]
  
  validates :title, presence: true
  validates :tag, presence: true
  validates :text, presence: true
end
