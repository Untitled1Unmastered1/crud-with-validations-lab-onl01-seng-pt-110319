class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year } #scope limited to only one title per release_year 
    validates :released, inclusion: { in: [true, false] } #boolean 

    with_options if: :released? do |song| 
        song.validates :release_year, presence: true #song has a release year 
        song.validates :release_year, numericality: { #song.release_year attribute is less than or equal to curr. year 
            less_than_or_equal_to: Date.today.year 
        }
    end

    def released?
        released 
    end

end
