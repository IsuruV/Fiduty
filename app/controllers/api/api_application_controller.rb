class Api::ApiApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

end
