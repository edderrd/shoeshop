class Store < ActiveRecord::Base
    has_many :articles

    def as_json(options = {})
    super(options || 
        {except:[:created_at, :updated_at]})
    end
end
