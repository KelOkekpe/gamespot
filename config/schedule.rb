job_type :rake,    "cd :path && :environment_variable=development bundle exec rake :task --silent :output"

set :output, "log/cron_log.log"
env :PATH, ENV['PATH']



every 1.day do # 1.minute 1.day 1.week 1.month 1.year is also supported
  rake "state:suspend_past_trial"
end
