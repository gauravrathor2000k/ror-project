module AccountBlock
    # AccountBlock
    class User < ApplicationRecord
      has_secure_password
      self.table_name = :users
    
  end
end