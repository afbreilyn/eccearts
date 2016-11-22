class HomeController < ApplicationController
  def index
  end

  def about
  end

  def community
  end

  def videos
  end

  def press
  end

  def download_pdf
    send_file(
      Rails.root.join('public', 'ECCE_Press_Package.zip'),
      :type=>"application/zip",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

  def etchings
  end

end
