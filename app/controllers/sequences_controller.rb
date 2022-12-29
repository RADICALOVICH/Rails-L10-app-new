require 'open-uri'

class SequencesController < ApplicationController

  include SequencesHelper

  URL = 'http://localhost:3000/server/result'
  def input; end

  def show
    @result = SequenceResult.new(sequence_params)
    return unless @result.valid?

    res_url = URL + "?number=#{@result.number}&string_array=#{@result.string_array.split.join('+')}"
    response = URI.open(res_url)
    case @result.mode
    when 'xml'
      render xml: response
    when 'html-server'
      render inline: server(response)
    when 'html-client'
      render xml: client(response)
    end
  end

  private

  def sequence_params
    params.permit(:number, :string_array, :mode)
  end
end
