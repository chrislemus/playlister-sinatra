module Slug
  extend ActiveSupport::Concern

  def slug
    self.name.gsub(/\s+/, '-').downcase
  end

  class_methods do

    def find_by_slug(slug)
      self.all.select{|song| song.slug == slug}[0]
    end

  end
end