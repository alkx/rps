require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test_rps.rb', 'test/game/test_*.rb',
                          'test/game/strategies/test_*.rb', 'test/models/test_*.rb', ]
  t.verbose = true
end
