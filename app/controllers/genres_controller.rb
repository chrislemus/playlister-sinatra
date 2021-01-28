class GenresController < ApplicationController
  get('/genres') {
    @genres = Genre.all
    erb :'genres/index'
  }

  get('/genres/:slug') {
    slug = params[:slug]
    @genre = Genre.find_by_slug(slug)
    @artists = @genre.artists
    @songs = @genre.songs
    erb :'genres/show'
  }
end