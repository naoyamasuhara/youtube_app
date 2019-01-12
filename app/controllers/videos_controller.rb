class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = "「#{@video.title}」を登録しました。"
      redirect_to videos_path
    else
      render 'new'
    end
  end

  def update
    if @video.update(video_params)
      flash[:success] = "「#{@video.title}」を更新しました。"
      redirect_to @video
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    flash[:danger] = "「#{@video.title}を削除しました。"
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title,:content,:youtube_uuid)
  end

  def set_video
    @video = Video.find(params[:id])
  end
    
end
