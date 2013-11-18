class StaticPagesController < ApplicationController
  before_action :set_cart, only: [:home]

  def home
    @products = Product.all
  end

  def help
  end

  def about
  end
  
  def contact
  end

end
