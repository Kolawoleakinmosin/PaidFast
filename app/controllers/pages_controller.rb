require "rqrcode"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def qr_generator

    qrcode = RQRCode::QRCode.new("https://buy.stripe.com/test_bIYdS7gBY4KL2cg9AA")

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    IO.binwrite("/tmp/stripe-qrcode.png", png.to_s)
  end

end
