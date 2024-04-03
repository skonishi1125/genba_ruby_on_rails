module ApplicationHelper
  require "rqrcode"
  require "rqrcode_png"
  require "chunky_png"

  def qrcode(url, size)
    if Rails.env.production?
      # 本番環境（Heroku）での処理
      qrcode = RQRCode::QRCode.new("https://アプリ名.herokuapp.com#{url}")
    elsif Rails.env.development?
      # 開発環境での処理
      qrcode = RQRCode::QRCode.new("http://localhost:3000#{url}")
    end
    svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: size,
      standalone: true,
      use_path: true
    ).html_safe
  end

end