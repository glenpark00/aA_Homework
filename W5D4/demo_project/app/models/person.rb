class Person < ApplicationRecord
    belongs_to(
        :house,
        class_name: 'House',
        foreign_key: :house_id,
        primary_key: :id
    )
    validates :name, :house_id, presence: true
end