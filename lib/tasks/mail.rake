task :mail => :environment do
  puts "sending email"
  @u=User.find(3)
  puts @u.accountInformation.email
  Notifier.deliver_welcome(@u)
end
