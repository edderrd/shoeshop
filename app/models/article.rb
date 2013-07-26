class Article < ActiveRecord::Base
  belongs_to :store

  def store_name
    store_name = self.store.presence ? self.store.name : nil
  end

  def as_json(options = nil)
    super(options ||
            { except: [:store_id, :created_at, :updated_at] })
    end
end
