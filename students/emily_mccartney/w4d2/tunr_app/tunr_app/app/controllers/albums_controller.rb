class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_artist

  # GET /albums
  # GET /albums.json
  def index
    if @artist.present?
      @albums = @artist.albums
    else
      @albums = Album.all
    end
    @titlename = 'albums list'
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
    @songs = @album.songs
    @artist = @album.artist
    @titlename = 'about album'
  end

  # GET /albums/new
  def new
    @album = Album.new
    @songs  = Song.order('title ASC') 
    @titlename = 'new album'
  end

  # GET /albums/1/edit
  def edit
    @songs  = Song.order('title ASC')
    @titlename = 'edit album'
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album.song_ids = params[:album][:song_ids]
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find_by :id =>params[:id]
      if @album.blank?
        redirect_to albums_path, alert: "Yo no album here, search again"
      end
    end

    def set_artist
      if params[:artist_id].present?
        @artist = Artist.find_by_id(params[:artist_id])
      else
        @artist = @album.artist if @album.present?
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description, :year, :artist_id)
    end
end
