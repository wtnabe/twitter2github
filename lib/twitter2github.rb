Dir.glob(File.dirname(__FILE__) + '/twitter2github/**/*.rb') { |f|
  require f.sub(/\.rb/, '')
}
