class StoresController < ApplicationController
  before_action :set_cart, only: [:index]

  def index
    @products = Product.all
  end
end