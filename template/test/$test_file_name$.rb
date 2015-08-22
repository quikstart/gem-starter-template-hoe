gem "minitest"
require "minitest/autorun"
require "$file_name$"

$sub_modules_for_test_klass$
class $test_klass$ < Minitest::Test
  def test_sanity
    flunk "write tests or I will kneecap you"
  end
end
