class StoryContentsController < ApplicationController
  before_action :set_story_content, only: [:show, :update, :destroy]

  # GET /story_contents
  def index
    @story_contents = StoryContent.all

    render json: @story_contents
  end

  # GET /story_contents/1
  def show
    render json: @story_content
  end

  # POST /story_contents
  def create
    @story_content = StoryContent.new(story_content_params)

    if @story_content.save
      render json: @story_content, status: :created, location: @story_content
    else
      render json: @story_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /story_contents/1
  def update
    if @story_content.update(story_content_params)
      render json: @story_content
    else
      render json: @story_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /story_contents/1
  def destroy
    @story_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_content
      @story_content = StoryContent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def story_content_params
      params.require(:story_content).permit(:title, :body, :language_id, :story_id)
    end
end
