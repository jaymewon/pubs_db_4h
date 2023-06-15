class Category < ApplicationRecord
    default_scope {order(:name)}

    scope :active, -> { where( active: true ) }
    scope :inactive, -> { where( active: false ) }
end
  