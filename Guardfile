guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/*/.+_spec\.rb$})
  watch(%r{^lib/selenium-launcher/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
end
