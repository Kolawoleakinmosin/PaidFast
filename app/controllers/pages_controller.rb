require "rqrcode"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :initialize_qrcode, only: [:qr_generator, :qr_code_download]

  def home
  end

  def qr_generator
    # NOTE: showing with default options specified explicitly
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
  end

  def qr_code_download
    send_data @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    ), filename: "qr_code.svg", type: "image/svg+xml"
  end

  def playground
  end

  def initialize_qrcode
    @qrcode = RQRCode::QRCode.new("https://buy.stripe.com/test_bIYdS7gBY4KL2cg9AA")
  end
end
