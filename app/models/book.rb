class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments
  has_many :favorites
  has_many :book_tags
  has_many :tags, through: :book_tags

  has_one :view_count

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tags(tag_names)
    current_tags = []
    current_tags = self.tags.pluck(:name) unless self.tags.nil?

    tag_names_for_remove = current_tags - tag_names
    tag_names_for_save = tag_names - current_tags

    tag_names_for_remove.each do |tag_name|
      self.tags.delete Tag.find_by(name: tag_name)
    end
    tag_names_for_save.each do |tag_name|
      self.tags << Tag.find_or_create_by(name: tag_name)
    end

  end
end
