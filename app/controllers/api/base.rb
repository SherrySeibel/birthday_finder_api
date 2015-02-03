class API::Base < ApplicationController
  module API
    class Base < Grape::API
      mount API::V1::Base
    end
  end
end
