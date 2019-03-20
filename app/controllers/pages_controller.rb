class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def faq
  end

  def about
  end

  def contact
  end
end
