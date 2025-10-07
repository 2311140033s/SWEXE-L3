mkdir -p bin
echo '#!/usr/bin/env bash
# Exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate' > bin/render-build.sh
