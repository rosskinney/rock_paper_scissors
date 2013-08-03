Dir.glob('./lib/*.rb').each do |library|
  require library
end