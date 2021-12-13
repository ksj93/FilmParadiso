class FavoriteGenresController < ApplicationController
  before_action :authenticate_user!

  def new
    @Favorite_genre = FavoriteGenre.new
    if params[:update_favorite]
      @Favorite_genre = FavoriteGenre.new(genre_name:params[:genre_name],genre_id:params[:genre_id],user_id:current_user.id)
      if current_user.favorite_genres.count <= 2
        if @Favorite_genre.save
          redirect_to new_favorite_genre_path,notice:"#{params[:genre_name]}を追加しました！"
        else
          redirect_to new_favorite_genre_path,notice:"#{params[:genre_name]}は既に追加されています！"
        end
      else
        flash.now[:alert] = '選択出来るジャンルは最大3個までです！！'
        render :new
      end
    end
  end

  def destroy
    @Favorite_genre = FavoriteGenre.find(params[:id])
    if @Favorite_genre.destroy
      redirect_to new_favorite_genre_path,notice:"#{@Favorite_genre.genre_name}を削除しました！"
    end
  end

end
