class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, :year, :description, :image_url, presence: true
  
    def self.search(keyword)
      where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"])
    end
    
    def self.searchByKeywordShowing(keyword, showing)
      logger.debug(showing)
      logger.debug(showing.class.name)
      where(["(name like? OR description like?) AND is_showing = ?", "%#{keyword}%", "%#{keyword}%", showing])
      # where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"])
  
      # where(["is_showing = ?", nil])
    end
end
