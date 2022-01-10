class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movies = Movie.all
  end

  def edit
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to admin_movies_path, notice: "登録しました！"
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def movie_params
    logger.debug(params)
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end
end
