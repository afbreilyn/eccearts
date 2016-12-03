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

  def etchings_pics
  end

  def download_retrospective
    send_file(
      Rails.root.join('public', 'Etchings-brochure.pdf'),
      :type=>"application/pdf",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

  def etchings_2017
  end

  def etchings_composers_faculty
  end

  def etchings_dancers_faculty
  end

  def etchings_ensemble
  end

  def etchings_app
  end


  def download_dance_app
    send_file(
      Rails.root.join('public', 'Etchings_Dance_Program_Pages.docx'),
      :type=>"application/docx",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

  def download_composition_app
    send_file(
      Rails.root.join('public', 'Etchings-2017-Application-Form.docx'),
      :type=>"application/docx",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

  def download_collaboration_app
    send_file(
      Rails.root.join('public', 'Etchings-2017-Body Movement-Application-Form.docx'),
      :type=>"application/docx",
      :x_sendfile=>true,
      :disposition => 'attachment'
    )
  end

  def etchings_body_movement_info
  end

  def etchings_composition_info
  end  

end
