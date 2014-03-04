set -e 

rm -f env_vars.sh
#export BASE_EMAIL=qatestautomation0-40k-h27@verticalresponse.com
export EMAIL_INDEX=${SLAVE_INDEX}
export BATCHES=1
export CAPYBARA_TIMEOUT=30


source $HOME/.rvm/scripts/rvm && source .rvmrc 


source env_vars.sh 
export SPEC_OPTS="--format documentation -t just_pending --order rand --require `bundle show ci_reporter`/lib/ci/reporter/rake/rspec_loader --format CI::Reporter::RSpec" 

INTEGRATION_URL=${TARGET} bundle exec rake ci:headlessly["rspec spec/integration/tools/email_40k_send.rb"] || echo "ignore fail"'
