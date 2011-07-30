# coding: utf-8
require './lib/icu4r'
require 'test/unit'

class UCollatorTest < Test::Unit::TestCase
  def test_tailor_simple
    c = UCollator.new("&e < a".u)
    assert_equal(-1,  c.strcoll("e".u, "a".u))
  end
  
  def test_tailor_complex
    c = UCollator.new("&9 < a, A < \304\201, a\314\204, \304\200, A\314\204 < c, C < ae, AE < a\315\236e, A\315\236E < e, E < \304\223, e\314\204, \304\222, E\314\204 < h, H < i, I < \304\253, i\314\204, \304\252, I\314\204 < k, K < m, M < n, N < o, O < \305\215, o\314\204, \305\214, O\314\204 < p, P < q, Q < r, R < s, S < t, T < u, U < \305\253, u\314\204, \305\252, U\314\204 < w, W < y, Y".u)
    assert_equal(-1,  c.strcoll("ak".u, "ae".u))
  end
  
  def test_strength
    c = UCollator.new("root")
    assert_equal(0,  c.strcoll("a".u, "a".u))
    assert_equal(1,  c.strcoll("A".u, "a".u))
    c.strength = UCollator::UCOL_SECONDARY
    assert_equal(0,  c.strcoll("A".u, "a".u))
  end
  
  def test_attrs
   c = UCollator.new("root")
   c[UCollator::UCOL_NUMERIC_COLLATION]= UCollator::UCOL_ON
   ar = %w(100 10 20 30 200 300).map {|a| a.to_u }.sort {|a,b| c.strcoll(a,b)}.map {|s| s.to_s }
   assert_equal(["10", "20", "30", "100", "200", "300"], ar)
   c[UCollator::UCOL_NUMERIC_COLLATION]= UCollator::UCOL_OFF
   ar = %w(100 10 20 30 200 300).map {|a| a.to_u }.sort {|a,b| c.strcoll(a,b)}.map {|s| s.to_s }
   assert_equal( ["10", "100", "20", "200", "30", "300"], ar)
  end
  
  def test_sort_key
   c = UCollator.new("root")
   c[UCollator::UCOL_NUMERIC_COLLATION]= UCollator::UCOL_ON
   ar = %w(100 10 20 30 200 300).sort_by {|a| c.sort_key(a.to_u) }
   assert_equal(["10", "20", "30", "100", "200", "300"], ar)
   c[UCollator::UCOL_NUMERIC_COLLATION]= UCollator::UCOL_OFF
   ar = %w(100 10 20 30 200 300).sort_by {|a| c.sort_key(a.to_u) }
   assert_equal( ["10", "100", "20", "200", "30", "300"], ar)
  end

end
