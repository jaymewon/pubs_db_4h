class Publication < ApplicationRecord
    belongs_to  :pub_num_prefix
    belongs_to  :contact, class_name: "Person"
    belongs_to  :status, optional: true
    belongs_to  :unit
    belongs_to  :availability, optional: true
    belongs_to  :designer, optional: true
    belongs_to  :code, optional: true
    belongs_to  :category
    
    has_many    :publication_authors, dependent: :destroy
    has_many    :authors, through: :publication_authors, source: :person
    
    scope   :all_pubs,  ->  { order( created_at: :desc ) }
    scope   :active,  ->  { where.not( status_id: Status::ARCHIVED ) }
    scope   :archived,  ->  { where( status_id: Status::ARCHIVED ) }
    scope   :blank_status,  ->  { where( status_id: nil ) }
end