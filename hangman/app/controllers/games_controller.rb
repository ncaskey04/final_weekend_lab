class GamesController < ApplicationController
  before_action :render_main_layout_if_format_html

  respond_to :json, :html

  def index

  end









  private

  def render_main_layout_if_format_html
    # check the request format
    if request.format.symbol == :html
      render "layouts/application"
    end
  end

end
