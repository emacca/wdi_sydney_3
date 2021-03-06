class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
    @titlename = 'artists list'
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @songs = @artist.songs

    @albums = @artist.albums
    @artist = Artist.find(params[:id])
    @titlename = 'about artist'
  end

  # GET /artists/new
  def new
    @artist = Artist.new
    @titlename = 'new artist'
  end

  # GET /artists/1/edit
  def edit
    @titlename = 'edit artist'
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find_by :id => params[:id]
      if @artist.blank?
        redirect_to artists_path, alert: "there is no such artist, please search for another"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :gender, :bio)
    end
end
