require 'rqrcode_png'
require 'chunky_png'
require 'rqrcode'


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :initialize_qrcode, only: [:qr_generator, :qr_generator_download, :qr_code_download]

  def home
    hash1 = Transaction.group_by_day(:created_at).sum(:price_cents)
    @amount_by_day = hash1.each do |key, value|
      hash1[key] = value / 100
    end

    hash2 = Transaction.group_by_week(:created_at).sum(:price_cents)
    @amount_by_week = hash2.each do |key, value|
      hash2[key] = value / 100
    end

    hash3 = Transaction.group_by_month(:created_at).sum(:price_cents)
    @amount_by_month = hash3.each do |key, value|
      hash3[key] = value / 100
    end

    hash4 = Transaction.group_by_day_of_week(:created_at, format: "%a").sum(:price_cents)
    @amount_this_week = hash4.each do |key, value|
      hash4[key] = value / 100
    end

    total = Transaction.where("DATE(created_at) = ?", Date.today).sum(:price_cents)
    @sum_today = total / 100
  end

  def qr_generator
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
  end

  def qr_code_download
    qr_code = RQRCode::QRCode.new('https://buy.stripe.com/test_bIYdS7gBY4KL2cg9AA')
    png = qr_code.as_png(
      color: '000',
      module_size: 5,
      standalone: true
    )
    vector_path = Rails.root.join('app', 'assets', 'images', 'vector.png')
    vector = ChunkyPNG::Image.from_file(vector_path).resize(580, 580)
    qr_x = (vector.width - png.width) / 2
    qr_y = (vector.height - png.height) / 2 - 55
    vector.compose!(png, qr_x, qr_y)

    logo_path = Rails.root.join('app', 'assets', 'images', 'logoqr.png')
    logo = ChunkyPNG::Image.from_file(logo_path).resize(45, 45)
    x = (vector.width - logo.width) / 2
    y = (vector.height - logo.height) / 2 - 55
    vector.compose!(logo, x, y)

    send_data vector.to_blob, filename: 'Your_qr_code.png', type: 'image/png'
  end

  def playground
  end

  private

  def initialize_qrcode
    @qrcode = RQRCode::QRCode.new("https://buy.stripe.com/test_bIYdS7gBY4KL2cg9AA")
  end
end
