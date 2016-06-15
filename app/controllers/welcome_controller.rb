class WelcomeController < ApplicationController
  def index
    @image = RubySvgImageGenerator.create_random("random_image", :theme => RubySvgImageGenerator::T_HUMAN_AVATARS)
  end

  def generate
    theme_name = params[:theme]
    @theme = RubySvgImageGenerator.const_get(theme_name).new

    if params[:parts].blank?
      @image = RubySvgImageGenerator.create_random("random_image", :theme => theme_name)
    else
      parts = params[:parts].collect {|part| part[1].to_i}
      @image = RubySvgImageGenerator.create("test_image", :theme => theme_name, :parts => parts)
    end
  end

end
