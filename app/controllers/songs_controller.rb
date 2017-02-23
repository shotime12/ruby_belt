class SongsController < ApplicationController
  def index
  	@user = User.find(session[:logged_in_user])
  	@songs = Music.all.reverse
  	
  end
  def add
  	@user = User.find(session[:logged_in_user])
  	Music.create(
  		artist: params[:artist],
  		title: params[:title],
  		user: @user,
  		play: 0)
  	redirect_to action: 'index'
  end

  def show
  	@song = Music.find(params[:id])
  	@user = User.find(session[:logged_in_user])
  	@other_users = User.where.not(id: @user.id)
  	@songlists = Songlist.where(music_id: @song.id)
  	
  	# puts @songlists.user.first_name
  	# puts @other_users.where(music_id: @song.id)

  end

  def add_to_playlist
  	@user = User.find(session[:logged_in_user])
  	@times_played = Songlist.find_by(user_id: @user.id, music_id: params[:id])
  	@song = Music.find(params[:id])
  	
  	puts '*'*50
  	puts @song.play
  	puts '*'*50
  	if @song.play == 0
  		@plays = 1
  		Songlist.create(
  	   	user_id: @user.id,
  	   	music_id: params[:id],
  	   	play: @plays)
  	else
  		@plays = @times_played.play
  	 	@plays += 1
		@times_played.update(
			play: @plays)  	 	
  	end
  	total_play=@song.play+1
  	puts '*'*50
  	puts @plays
  	puts '*'*50
  	
  	@song.update(
  		play: total_play)
  	puts '*'*50
  	puts @song.play
  	puts '*'*50

  	redirect_to action: 'index'
  end
end
