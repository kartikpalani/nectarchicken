class StaticPagesController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def pay_tax
    $withholding = 0
    redirect_to "/balance_sheets"
  end
end
