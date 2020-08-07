class World < ApplicationRecord
    belongs_to :user
        #when delete world, deletes chars and plots
    has_many :characters, :dependent => :destroy
    accepts_nested_attributes_for :characters
    
    has_many :plots, :dependent => :destroy
    accepts_nested_attributes_for :plots

    validates :name, presence: true, uniqueness: true
    #validates :genre, presence: true 

    #most plots in a world
    def self.most_plots
        joins(:plots).group("worlds.id").order("COUNT(*) DESC").select("worlds.*").limit(1)
    end

end
