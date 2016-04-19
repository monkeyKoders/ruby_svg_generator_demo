class WelcomeController < ApplicationController
  def index
    @image = '' #RubySvgImageGenerator.create "test", :theme => RubySvgImageGenerator::T_HUMAN_AVATARS
  end

  def theme
    @name_theme = params[:theme]
    @theme = "RubySvgImageGenerator::#{@name_theme}".constantize.new
  end

  def generate
    parts = []

    params[:parts].each do |part|
      class_part = part[0].constantize.new
      parte = class_part.get_matrix(part[1].to_i)

      parts << parte
    end

    debugger
    @image = RubySvgImageGenerator.create("test", :theme => params['class_theme'], :parts => params[:parts])
  
    theme = "RubySvgImageGenerator::#{params['class_theme']}".constantize.new
    matrix_image = theme.merge_parts(parts)
    
    @image = RubyMatrixToSvg.matrix_to_svg('test', matrix_image)
  end

end
