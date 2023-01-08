class Category < ApplicationRecord

    after_save :category_after_saved_method
    bedore_save :category_before_saved_method

    has_many :products
    
    def category_after_saved_method
        p 'after save working'
    end

    def category_before_saved_method
        p 'before save working'
    end
end
