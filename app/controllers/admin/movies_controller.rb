class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

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
    if !@movie.present?
      flash.now[:danger] = "編集元の映画は存在しません。"
      render :index
    end
    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: "編集しました！"
    else
      flash.now[:danger] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      redirect_to admin_movies_path, notice: "削除しました！"
    else
      flash.now[:danger] = "削除に失敗しました。"
      render :edit
    end
  end

  def movie_params
    logger.debug(params)
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
