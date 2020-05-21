require 'mini_magick'

MiniMagick.configure do |config|
  config.shell_api = "posix-spawn"

  ## DOESN'T WORK
  # config.tmpdir = Rails.root.join('tmp', 'mini-magick').to_s
end
