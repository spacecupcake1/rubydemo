class Product < ApplicationRecord
    has_many :orders
  
    # Aktiviert optimistisches Locking
    self.locking_column = :lock_version
  end
  