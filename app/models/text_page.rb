class TextPage < ActiveRecord::Base

  extend ::I18nColumns::Model
  i18n_columns :title, :body, :ferret => true

  attr_accessible :name, :section_id, :weight
  belongs_to :section

  validates :section, :presence => true
  validates :name, :format => /^[a-z][a-z0-9\-]+$/

  def title
    t = super
    t = self.name if t.blank?
    t
  end

  def to_param
    self.name.to_s.size > 0 ? self.name : self.id
  end
end
