class WelcomeController < ApplicationController
  def index
    @image = RubySvgImageGenerator.create_random("random_image", :theme => RubySvgImageGenerator::T_HUMAN_AVATARS)
    @theme = RubySvgImageGenerator.get_theme_instance(RubySvgImageGenerator::T_HUMAN_AVATARS)
  end

  def theme_change
    @theme = RubySvgImageGenerator.get_theme_instance(params[:theme])
  end

  def generate
    theme_name = params[:theme]
    @theme = RubySvgImageGenerator.get_theme_instance(theme_name)

    if params[:parts].blank?
      @image = RubySvgImageGenerator.create_random("random_image", :theme => theme_name)
    else
      parts = params[:parts].collect {|part| part[1].to_i}
      @image = RubySvgImageGenerator.create("test_image", :theme => theme_name, :parts => parts)
    end
  end

end
