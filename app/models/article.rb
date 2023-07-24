# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  delegate :find, :create, to: :comments, prefix: true

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
