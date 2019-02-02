require 'test/unit'
require 'palindrome'
require 'awesome_print'

# A placeholder test for verifying that tests do in fact run on this type of code.
class PalindromeTest < Test::Unit::TestCase
    SAS_P = "sas"
  
    def setup
    end
  
    def test_p_match
      res = Palindrome.p_match("esase", 1, 3)
      assert(res.eql?("esase"), "Expected esase but was #{res}" )
    end
  
    def test_p_match_single
      res = Palindrome.p_match("esasf",1, 3)
      assert(res.eql?(SAS_P), "Expected #{SAS_P} but was #{res}" )
    end
  
    def test_find_all_none
      pal_ary = Palindrome.find_all("etch") 
      assert(pal_ary.size == 0, "Expected 0 but size was " + pal_ary.size.to_s)
    end
  
    def test_find_all_one_beginning
      pal_ary = Palindrome.find_all("sasit") 
      assert(pal_ary.size == 1, "Expected 1 but size was " + pal_ary.size.to_s)
      assert(pal_ary[0].eql?(SAS_P), "Expected #{SAS_P} but was " + pal_ary[0])
    end
  
    def test_find_all_one_end
      pal_ary = Palindrome.find_all("zerosas") 
      assert(pal_ary.size == 1, "Expected 1 but size was " + pal_ary.size.to_s)
      assert(pal_ary[0].eql?(SAS_P), "Expected #{SAS_P} but was " + pal_ary[0])
    end
  
    def test_find_all_one_middle
      pal_ary = Palindrome.find_all("zerosasend") 
      assert(pal_ary.size == 1, "Expected 1 but size was " + pal_ary.size.to_s)
      assert(pal_ary[0].eql?(SAS_P), "Expected #{SAS_P} but was " + pal_ary[0])
    end
  end