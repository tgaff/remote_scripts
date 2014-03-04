set -e
source $HOME/.rvm/scripts/rvm && source .rvmrc

export SPEC_OPTS="--format documentation --order rand --require `bundle show ci_reporter`/lib/ci/reporter/rake/rspec_loader --format CI::Reporter::RSpec"
INTEGRATION_URL=${TARGET} bundle exec rake ci:headlessly["rspec spec/integration/tools/sign_up_user_X_times.rb"] || echo "ignore fail"
