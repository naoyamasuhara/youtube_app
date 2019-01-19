class VideosController < ApplicationController
  before_action :set_video, only: [:show]
  before_action :set_editable_video, only: [:edit, :update, :destroy]

  def index
    @videos = Video.order(id: :desc)
  end

  def show
  end

  def new
    @video = current_user.videos.build
  end

  def edit
  end

  def create
    @video = current_user.videos.build(video_params)
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
    params.require(:video).permit(:title,:content,:url)
  end

  def set_video
    @video = Video.find(params[:id])
  end
  
  def set_editable_video
    @video = current_user.videos.find(params[:id])
    @video.url = 'https://www.youtube.com/watch?v=' + @video.youtube_uuid
  end

end
