module RMathGuard
	module Numbers
		ZERO =
			Digit.build do
			full_row :top
			full_row :bottom
			full_column :first
			full_column :last
			end

		ONE =
			Digit.build do
			full_column :last
			end

		TWO =
			Digit.build do
			full_row :top
			full_row :middle
			full_row :bottom
			half_column :top_right
			half_column :bottom_left
			end

		THREE =
			Digit.build do
			full_row :top
			full_row :middle
			full_row :last
			full_column :last
			end

		FOUR =
			Digit.build do
			half_column :top_left
			full_row :middle
			full_column :last
			end

		FIVE =
			Digit.build do
			full_row :top
			full_row :middle
			full_row :bottom
			half_column :top_left
			half_column :bottom_right
			end

		SIX =
			FIVE.build do
			full_column :first
			end

		SEVEN =
			Digit.build do
			full_row :top
			full_column :last
			end

		EIGHT =
			THREE.build do
			full_column :first
			end

		NINE =
			FIVE.build do
			full_column :last
			end
	end

  module Operators
    MINUS =
      Digit.build do
        full_row :middle
      end

    PLUS =
      Digit.build do
        full_row :middle
        column(1, 1..3)
      end

    EQUALS =
      Digit.build do
        full_row 1
        full_row 3
      end
  end
end