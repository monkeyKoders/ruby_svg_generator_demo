class WelcomeController < ApplicationController
  def index
    @image = '' #RubySvgImageGenerator.create "test", :theme => RubySvgImageGenerator::T_HUMAN_AVATARS
  end

  def theme
    @name_theme = params[:theme]
    @theme = "RubySvgImageGenerator::#{@name_theme}".constantize.new
  end

  def generate
    theme = params[:class_theme]
    parts = params[:parts].collect {|part| part[0].to_i}
    @image = RubySvgImageGenerator.create "test_image", :theme => theme, :parts => parts
  end

end
