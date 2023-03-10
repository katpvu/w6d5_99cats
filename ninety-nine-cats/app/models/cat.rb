class Cat < ApplicationRecord
    CAT_COLORS = ["black", "orange", "white", "brown", "grey"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: {in: %w(M F) }
    validates  :color, inclusion: {in: CAT_COLORS }
    validate :birth_date_cannot_be_in_the_future
    
    def birth_date_cannot_be_in_the_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "cannot be in the future lol")
        end
    end
end
