class LikesController < ApplicationController
  # GET /likes
  # GET /likes.json
  def index
    @likes = current_user.likes.map { |like| like.pin_id }
    @pins = @likes.map { |pin| Pin.find(pin) }
  end

  # POST /likes
  # POST /likes.json
  def create
    @pin = Pin.find(params[:pin_id])
    @like = current_user.likes.build(:pin_id => params[:pin_id])
    if !@pin.liking_users.include? current_user && @like.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash[:alert] = "Unable to like pin."
      redirect_to root_url
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @pin = @like.pin
    if @like.destroy
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    end
  end
end
