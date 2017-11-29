class AsistaController < ApplicationController
  def parse
    arg = params[:argument]
    res = {status: false, data: nil}

    parser = Parser.new
    parser.parse arg

    res[:data] = parser.get_result
    res[:status] = true unless res[:data].empty?

    render :json => res.to_json
  end
end
