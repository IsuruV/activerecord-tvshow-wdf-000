class Show < ActiveRecord::Base
  def self.highest_rating
    Show.maximum(:rating)
  end

  def self.most_popular_show
    # Show.all.maximum(:rating)
    # Show.having('MAX(rating)').group('rating').limit(1)
    show = Show.select(:id, :name, :network, :day, :rating, :shows, :season).where("rating == '#{self.highest_rating}'")
    show[0]
  end

  def self.lowest_rating
    Show.minimum(:rating)
  end

  def self.least_popular_show
    show = Show.select(:id, :name, :network, :day, :rating, :shows, :season).where("rating == '#{self.lowest_rating}'")
    show[0]
  end

  def self.ratings_sum
    Show.sum(:rating)
  end

  def self.popular_shows
    Show.select(:id, :name, :network, :day, :rating, :shows, :season).where("rating > '5'")

  end

  def self.shows_by_alphabetical_order
    Show.all.order(:name)
  end
end
