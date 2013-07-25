class Store < ActiveRecord::Base
    has_many :articles

    def self.map
    end
end
