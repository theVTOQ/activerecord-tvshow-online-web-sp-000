class Show < ActiveRecord::Base
  def self.highest_rating
    self.maximum(:rating)
  end

  def self.most_popular_show
    max_rating = self.highest_rating
    self.find_by rating: max_rating
  end

  def self.lowest_rating
    self.minimum(:rating)
  end

  def self.least_popular_show
    min_rating = self.lowest_rating
    self.find_by rating: min_rating
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    self.order(:name).to_a
  end
end
