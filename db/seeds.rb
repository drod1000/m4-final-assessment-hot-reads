Link.destroy_all

Link.create(url: 'http://hoturl.com', read: 10)

9.times do |i|
  Link.create(url: "http://topurl#{i}.com", read: 5)
end

10.times do |i|
  Link.create(url: "http://someurl#{i}", read: 2)
end
