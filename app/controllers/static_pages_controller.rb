class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @entry = current_user.entries.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = Entry.paginate(page: params[:page])
    end

  end

  def help
  end

  def contact
  end
end
