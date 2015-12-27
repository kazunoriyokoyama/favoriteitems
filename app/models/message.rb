class Message < ActiveRecord::Base
     
  extend Enumerize
  enumerize :sex, in: { 男: 1, 女: 2}
  
  validates :name , length: { maximum: 15 } , presence: true
  validates :body , length: { minimum: 2, maximum: 20 } , presence: true
  
  
end
