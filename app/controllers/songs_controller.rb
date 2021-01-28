class SongsController < ApplicationController


  get('/songs') {
    @songs = Song.all
    erb :'songs/index'
  }

  patch('/songs') {
    # binding.pry
    @song = Song.find(params[:song_id])
    artist = Artist.find_or_create_by(name: params['Artist Name'])
    @song.update(artist_id: artist.id)
    # binding.pry
    # redirect "/songs/#{song.slug}/edit"§
    redirect "/songs/#{@song.slug}"
  }

  post('/songs') {
    song_name = params['name']
    genre_name = params.select{|k,v| v == 'genre'}.keys[0]
    genre = Genre.find_or_create_by(name: genre_name)
    song = Song.create(name: song_name)
    artist_name = params['Artist Name']
    
    if !artist_name.empty?
      song.artist = Artist.find_or_create_by(name: artist_name)
      song.save
    end
    
    SongGenre.create(song_id: song.id, genre_id: genre.id)
    
    redirect "/songs/#{song.slug}"
  }

  get('/songs/new') {
    @genres = Genre.all
    erb :'songs/new'
  }

  get('/songs/:slug/edit') {
    @song = Song.find_by_slug(params[:slug])
    @song_genres = @song.genres
    @all_genres = Genre.all
    erb :'songs/edit'
  }

  get('/songs/:slug') {
    slug = params[:slug]
    @song = Song.includes(:genres).find_by_slug(slug)
    
    erb :'songs/show'
  }


end