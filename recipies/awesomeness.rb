#
# A collection of commonly-used (yet, non-intrusive) Capistrano tasks at Collective Idea.
#

# don't do a fresh checkout, just svn update
set :deploy_via, :remote_cache

after "deploy:update_code", "deploy:web:disable"
after "deploy:restart",     "deploy:web:enable"
after "deploy:start",       "deploy:web:enable"
after "deploy",             "deploy:cleanup"
after "deploy:migrations",  "deploy:cleanup"

load 'logs'
load 'backup'
load 'mongrel'
load 'apache'