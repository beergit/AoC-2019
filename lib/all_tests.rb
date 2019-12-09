require 'test/unit'
require 'test/unit/testresult'
(1..25).each do |t|
  d = "../#{t}"
  next unless Dir.exists? d
  $LOAD_PATH << d
  require "tc_advent#{t}"
end

class TS_AoC_2019
  def self.suite()
    suite = Test::Unit::TestSuite::new
    return suite
  end
end

tr = Test::Unit::TestResult::new

TS_AoC_2019.suite.run(tr) do |result|
  puts(result)
end
