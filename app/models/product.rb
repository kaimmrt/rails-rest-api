class Product < ApplicationRecord
    has_one_attached :product_image

    belongs_to :category

    validates :name, presence: true, length: {minimum:2, maximum:20}
    validates :description, presence: true, length: {minimum:50, maximum:200}
    validates :quantity, presence: true, numericality: {grater_than_or_equals: 0, less_than: 100}
    validates :price, presence: true, numericality: {grater_than: 0}
    validate :name_start_with_a

    def name_start_with_a
        if !self.name_start_with_?('A')
            errors.add(:name, "name must start with letter a")
        end
    end

end
