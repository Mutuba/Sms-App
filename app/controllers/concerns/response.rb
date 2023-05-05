# frozen_string_literal: true

# app/controller/concerns/response.rb
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
