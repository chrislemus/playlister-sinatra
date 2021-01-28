class ApplicationRecord < ActiveRecord::Base
  include Slug
  self.abstract_class = true
end