module RMathGuard
	module Numbers
    extend self

    @@rows = 5
    @@columns = 3

    def resize(rows = 3, columns = 5)
      @@rows = rows
      @@columns = columns
      constants.each do |const|
        remove_const(const)
        const_set(const, send("make_#{const.downcase}"))
      end
    end

    def make_zero
			Digit.build(@@rows, @@columns) do
        full_row :top
        full_row :bottom
        full_column :first
        full_column :last
			end
    end

    def make_one
			Digit.build(@@rows, @@columns) do
        full_column :last
			end
    end

    def make_two
			Digit.build(@@rows, @@columns) do
        full_row :top
        full_row :middle
        full_row :bottom
        half_column :top_right
        half_column :bottom_left
			end
    end

    def make_three
			Digit.build(@@rows, @@columns) do
        full_row :top
        full_row :middle
        full_row :last
        full_column :last
			end
    end

    def make_four
			Digit.build(@@rows, @@columns) do
        half_column :top_left
        full_row :middle
        full_column :last
			end
    end

    def make_five
			Digit.build(@@rows, @@columns) do
        full_row :top
        full_row :middle
        full_row :bottom
        half_column :top_left
        half_column :bottom_right
      end
    end

    def make_six
			make_five.build do
        full_column :first
			end
    end

    def make_seven
			Digit.build(@@rows, @@columns) do
        full_row :top
        full_column :last
			end
    end

    def make_eight
			make_three.build do
        full_column :first
			end
    end

    def make_nine
			make_five.build do
        full_column :last
			end
    end

    ZERO = make_zero
    ONE = make_one
    TWO = make_two
    THREE = make_three
    FOUR = make_four
    FIVE = make_five
    SIX = make_six
    SEVEN = make_seven
    EIGHT = make_eight
    NINE = make_nine
	end

  module Operators
    extend self

    @@rows = 5
    @@columns = 3

    def resize(rows = 3, columns = 5)
      @@rows = rows
      @@columns = columns
      constants.each do |const|
        remove_const(const)
        const_set(const, send("make_#{const.downcase}"))
      end
    end

    def make_minus
      Digit.build(@@rows, @@columns) do
        full_row :middle
      end
    end

    def make_plus
      Digit.build(@@rows, @@columns) do
        full_row :middle
        column(middle_column, 1..(self.size - 2))
      end
    end

    def make_equals
      Digit.build(@@rows, @@columns) do
        full_row(middle - 1)
        full_row(middle + 1)
      end
    end

    PLUS = make_plus
    MINUS = make_minus
    EQUALS = make_equals
  end
end