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

  def dashboard
    hash1 = Transaction.group_by_day(:timestamp).sum(:price_cents)
    @amount_by_day = hash1.each do |key, value|
      hash1[key] = value / 100
    end

    hash2 = Transaction.group_by_week(:timestamp).sum(:price_cents)
    @amount_by_week = hash2.each do |key, value|
      hash2[key] = value / 100
    end

    hash3 = Transaction.group_by_month(:timestamp).sum(:price_cents)
    @amount_by_month = hash3.each do |key, value|
      hash3[key] = value / 100
    end

    hash4 = Transaction.group_by_day(:timestamp, format: "%a %e %b").where("timestamp > ?", Date.today - 8.days).sum(:price_cents)
    @amount_this_week = hash4.each do |key, value|
      hash4[key] = value / 100
    end

    total = Transaction.where("DATE(timestamp) = ?", Date.today).sum(:price_cents)
    @sum_today = total / 100

    total2 = Transaction.where("DATE(timestamp) = ?", Date.today - 1.days).sum(:price_cents)
    @sum_yesterday = total2 / 100
  end
end
