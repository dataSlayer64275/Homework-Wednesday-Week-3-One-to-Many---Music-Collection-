require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

artist1 = Artist.new({
  'name' => 'The White Stripes'
  })

artist1.save

artist2 = Artist.new({
  'name' => 'Bob Marley'
  })

artist2.save

album1 = Album.new({
  'title' => 'Get Behind me Satan',
  'genre' => 'Rock',
  # 'artist_id' => "#{artist1.id}"
  })

album2 = Album.new({
  'title' => 'Catch a fire',
  'genre' => 'Reggae',
  # 'artist_id' => "#{artist2.id}"
  })
