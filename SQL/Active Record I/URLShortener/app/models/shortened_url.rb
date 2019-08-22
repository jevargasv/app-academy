# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string
#  short_url :string
#  user_id   :bigint
#

class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id

  has_many :visits

  has_many :visitors,
    through: :visits,
    source: :user

  validates :long_url, presence: true, uniqueness: true

  def self.random_code
    code = nil
    while code == nil || ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom::urlsafe_base64
    end

    code
  end

  def self.create_shortened_url!(options)
    user = options[:user]
    long_url = options[:long_url]

    ShortenedUrl.create!(
      long_url: long_url,
      short_url: ShortenedUrl.random_code,
      user_id: user.id
    )
  end
end