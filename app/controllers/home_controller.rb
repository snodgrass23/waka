class HomeController < ApplicationController
  def index
    render html: "<h1>Hello World!</h1><p>Welcome to Waka on Railway</p>".html_safe
  end
end
