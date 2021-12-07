class FavoriteGenresController < ApplicationController
  before_action :authenticate_user!

  def new
    @Favorite_genre = FavoriteGenre.new
    if params[:update_favorite]
      @Favorite_genre = FavoriteGenre.new(genre_name:params[:genre_name],genre_id:params[:genre_id],user_id:current_user.id)
      if current_user.favorite_genres.count <= 4
        if @Favorite_genre.save
          redirect_to new_favorite_genre_path
        else
          render :new
        end
      else
        flash.now[:alert] = '選択出来るジャンルは最大５個までです！！'
        render :new
      end
    end
  end

  def destroy
    @Favorite_genre = FavoriteGenre.find(params[:id])
    if @Favorite_genre.destroy
      redirect_to new_favorite_genre_path
    end
  end

end
