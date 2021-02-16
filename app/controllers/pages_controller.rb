class PagesController < ApplicationController
  def home
    @surfboards = Surfboard.all.sample(3)
  end
end
