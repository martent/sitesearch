class TermsController < ApplicationController
  before_action :authorize
  before_action { add_body_class('admin') }

  def index
    @terms = Term.order("lower(name)").includes(:recommendation)
  end
end
