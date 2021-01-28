class ArtistsController < ApplicationController
  get('/artists') {
    @artists = Artist.all
    erb :'artists/index'
  }

  get('/artists/:slug') {
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    erb :'artists/show'
  }
end
