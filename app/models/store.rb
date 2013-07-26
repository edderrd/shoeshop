class Store < ActiveRecord::Base
    has_many :articles
    validates :name, presence: true
    scope :recent, -> { order(created_at: :desc) }

    def as_json(options = nil)
    super(options || 
        {except: [:created_at, :updated_at]})
    end
end
