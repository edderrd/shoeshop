class Article < ActiveRecord::Base
  belongs_to :store

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :total_in_shelf, numericality: { only_integer: true }
  validates :total_in_vault, numericality: { only_integer: true }

  scope :recent, -> { order(created_at: :desc) }

  def store_name
    store_name = self.store.presence ? self.store.name : nil
  end

  def as_json(options = nil)
    options = super(options ||
            { except: [:store_id, :created_at, :updated_at], methods: [:store_name] })
  end
end
