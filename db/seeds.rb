# Add seed data here. Seed your database with `rake db:seed`

songs = Dir.entries('./db/data').select{|f| f[/.mp3$/]}
songs.each{ |song|
  artist_name, info = song.split(' - ')
  song_name = info.split(' [')[0]
  genre_name = info[/(?<=\[).+?(?=\])/]

  artist = Artist.find_or_create_by(name: artist_name)
  genre = Genre.find_or_create_by(name: genre_name)
  song = Song.create(name: song_name, artist_id: artist.id)
  SongGenre.create(song_id: song.id, genre_id: genre.id)
}

