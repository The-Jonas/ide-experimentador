class HelloController < ApplicationController
  def world
    @tags = "teste"
  end
  def index
    render json: Tag.all
  end
end
