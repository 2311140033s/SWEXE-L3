source "https://rubygems.org"

# ---- 基本構成 ----
gem "rails", "~> 8.1.0"
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# ---- 環境別のデータベース設定 ----
group :development, :test do
  # Cloud9などローカル開発で使うDB
  gem "sqlite3", ">= 2.1"
end

group :production do
  # Renderなど本番環境で使うDB
  gem "pg", "~> 1.5"
end

# ---- その他の便利Gem ----
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma
gem "thruster", require: false

# Use Kamal (optional for container deploys)
gem "kamal", require: false

# ---- 開発・テスト環境専用のGem ----
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# ---- Windows対応 ----
gem "tzinfo-data", platforms: %i[windows jruby]
