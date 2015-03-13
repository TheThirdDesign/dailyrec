class Post < ActiveRecord::Base
has_many :comments

  def self.text_search(query)
    if query.present?
      where("title @@ :q or content @@ :q or teaser @@ :q", q: query)
    else
      scoped
    end
  end
end
