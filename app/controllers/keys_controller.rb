class KeysController < ApplicationController
  respond_to :js

  def index
    @keys = current_user.keys.all
  end

  def new
    @key = current_user.keys.new

    respond_with(@key)
  end

  def create
    @key = current_user.keys.new(params[:key])
    @key.save

    respond_with(@key)
  end

  def destroy
    @key = current_user.keys.find(params[:id])
    @key.destroy

    respond_to do |format|
      format.html { redirect_to keys_url }
      format.js { render :nothing => true }
    end
  end
end
