#
# Gemspec for Windows platforms. We can't put these in the main gemspec because
# it results in bundler platform hell when trying to build the gem.
#
# Set $BUILD_PLATFORM when calling gem build with this gemspec to build for
# Windows platforms like x86-mingw32.
#

s = eval(File.read(File.join(File.dirname(__FILE__), 'rest-client.gemspec')))

platform = ENV['BUILD_PLATFORM'] || RUBY_PLATFORM

case platform
when /(mingw|mswin)/
  # ffi is needed for RestClient::Windows::RootCerts
  s.add_dependency('ffi', '~> 1.15')
  s.platform = platform
end

s
