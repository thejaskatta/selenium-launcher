guard :rspec, cmd: 'clear; bundle exec rspec' do
  watch(%r{^spec/*/.+_spec\.rb$})
  watch(%r{^lib/selenium-connect/*/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
end
