class SongsController < ApplicationController

  def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.create(song_params(params))
    if @song.errors.full_messages.size > 0
      render :new
    else
      redirect_to song_path(@song)
    end
	end

	def edit
	  @song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
	  @song.update(post_params(params))
    if @song.errors.full_messages.size > 0
      render :edit
    else
      redirect_to song_path(@song)
    end
	end

	private

	def song_params(*args)
		params.require(:song).permit(*args)
	end

end
