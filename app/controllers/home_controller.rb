class HomeController < ApplicationController
  def index
  end

  def about
  end

  def community
  end

  def media
  end
  
  def press
  end

  def download_pdf

    # debugger

    # send_file(
    #   "#{Rails.root}/public/test.pdf",
    #   filename: "test.pdf",
    #   type: "application/pdf",
    #   :x_sendfile=>true
    # )

    send_file(
      Rails.root.join('public', 'Ecce-Press-Packet.zip'),
      :type=>"application/zip",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

end
