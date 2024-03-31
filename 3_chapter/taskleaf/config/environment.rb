# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# carrierwave アップローダーとmodel取り付け時の以下のエラーを防ぐ
# NameError (uninitialized constant User::IconUploader): など
require 'carrierwave/orm/activerecord'