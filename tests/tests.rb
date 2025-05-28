require 'test/unit'
require_relative "../expressions"

class AdditionTest < Test::Unit::TestCase

  def test_addition
    addition = Addition.new(Numeral.new(5), Numeral.new(4))
    assert_equal(9, addition.evaluate())
  end

end

class SubtractionTest < Test::Unit::TestCase
  
  def test_subtraction
    subtraction = Subtraction.new(Numeral.new(9), Numeral.new(4))
    assert_equal(5, subtraction.evaluate())
  end
end

class MinusTest < Test::Unit::TestCase
  
  def test_minus
    minus = Minus.new(Numeral.new(9), Numeral.new(4))
    assert_equal(5, minus.evaluate())
  end
end

class MultiplicationTest < Test::Unit::TestCase

  def test_multiplication
    multiplication = Multiplication.new(Numeral.new(4), Numeral.new(5))
    assert_equal(20, multiplication.evaluate())
  end

end

class DivisionTest < Test::Unit::TestCase

  def test_division
    division = Division.new(Numeral.new(100), Numeral.new(5))
    assert_equal(20, division.evaluate())
  end

end

class PowerTest < Test::Unit::TestCase

  def test_power
    power = Power.new(Numeral.new(3), Numeral.new(3))
    assert_equal(27, power.evaluate())
  end

end

class ComparisonEqualTest < Test::Unit::TestCase

  def test_comparison_equal
    equal = ComparisonEqual.new(Numeral.new(22), Numeral.new(22))
    assert_equal(true, equal.evaluate())
  end

end

class ComparisonLessThanTest < Test::Unit::TestCase

  def test_less_than_false
    less_than = ComparisonLessThan.new(Numeral.new(5), Numeral.new(4))
    assert_false(less_than.evaluate())
  end

  def test_less_than_true
    less_than = ComparisonLessThan.new(Numeral.new(3), Numeral.new(9))
    assert_true(less_than.evaluate())
  end

end

class ComparisonGreaterThanTest < Test::Unit::TestCase

  def test_greater_than_false
    greater = ComparisonGreaterThan.new(Numeral.new(22), Numeral.new(32))
    assert_false(greater.evaluate())
  end

  def test_greater_than_true
    greater = ComparisonGreaterThan.new(Numeral.new(32), Numeral.new(2))
    assert_true(greater.evaluate())
  end

end

class ComparisonGreaterThanEqualTest < Test::Unit::TestCase
  
  def test_greater_than_equal_false
    greater_equal = ComparisonGreaterThanOrEqual.new(Numeral.new(32), Numeral.new(64))
    assert_false(greater_equal.evaluate())
  end

  def test_greater_than_equal_true
    greater_equal = ComparisonGreaterThanOrEqual.new(Numeral.new(264), Numeral.new(110))
    assert_true(greater_equal.evaluate())
  end

end

class ComparisonLessThanEqualTest < Test::Unit::TestCase

  def test_less_than_false
    less_than = ComparisonLessThanOrEqual.new(Numeral.new(42), Numeral.new(22))
    assert_false(less_than.evaluate())
  end

  def test_less_than_true
    less_than = ComparisonLessThanOrEqual.new(Numeral.new(25), Numeral.new(432))
    assert_true(less_than.evaluate())
  end

  def test_less_than_equal_true
    less_than_equal = ComparisonLessThanOrEqual.new(Numeral.new(25), Numeral.new(25))
    assert_true(less_than_equal.evaluate())
  end

end

class LogicalAndTest < Test::Unit::TestCase

  def test_logical_and_two_true_values
    logical_and = LogicalAnd.new(TruthValue.new(true), TruthValue.new(true))
    assert_true(logical_and.evaluate())
  end

  def test_logical_and_one_true_value
    logical_and = LogicalAnd.new(TruthValue.new(true), TruthValue.new(false))
    assert_false(logical_and.evaluate())
  end

  def test_logical_and_two_false_values
    logical_and = LogicalAnd.new(TruthValue.new(false), TruthValue.new(false))
    assert_false(logical_and.evaluate())
  end

end

class LogicalOrTest < Test::Unit::TestCase

  def test_logical_or_two_true_values
    logical_or = LogicalOr.new(TruthValue.new(true), TruthValue.new(true))
    assert_true(logical_or.evaluate())
  end

  def test_logical_and_one_true_value
    logical_or = LogicalOr.new(TruthValue.new(true), TruthValue.new(false))
    assert_true(logical_or.evaluate())
  end

  def test_logical_and_two_false_values
    logical_or = LogicalOr.new(TruthValue.new(false), TruthValue.new(false))
    assert_false(logical_or.evaluate())
  end

end
