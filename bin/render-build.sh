#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install all gems specified in Gemfile
echo "🔹 Installing gems..."
bundle install --without development test

# Ensure puma is installed on Render
echo "🔹 Installing Puma web server..."
gem install puma

# Precompile assets for production
echo "🔹 Precompiling assets..."
bundle exec rake assets:precompile

# Clean up old compiled assets
echo "🔹 Cleaning old assets..."
bundle exec rake assets:clean

# Run database migrations
echo "🔹 Running database migrations..."
bundle exec rake db:migrate

echo "✅ Render build script completed successfully!"
