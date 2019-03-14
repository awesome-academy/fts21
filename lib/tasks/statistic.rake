namespace :statistic do
  desc "Statistic of trainee to supervisor at end of month"
  task statistic_trainee_end_month: :environment do
    StatisticTraineeWorker.perform_async
  end
end
