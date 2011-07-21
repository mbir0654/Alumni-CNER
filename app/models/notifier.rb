class Notifier < ActionMailer::Base

  def welcome(user)
    @info = user.accountInformation
    subject       "Bine Ati Venit"
    from          "cner.alumni@gmail.com"  
    recipients    user.accountInformation.email  
    sent_on       Time.now
    content_type  "text/html"
    body          :info => @info
    puts "sending mail"
  end

  def generated(mail,pass)
    subject       "relansare alumni.e-racovita.ro"
    from          "cner.alumni@gmail.com"
    recipients    mail
    sent_on       Time.now
    content_type  "text/html"
    body          :parola => pass, :mail => mail
    puts "sending mail"
  end
  
  def anunt(mail)
    subject       "Ziua internationala pentru eliminarea discriminarii rasiale - luni 21 martie, ora 14:15, sala festiva, CNER"
    from          "cner.alumni@gmail.com"
    recipients    mail
    sent_on       Time.now
    content_type  "text/html"
    puts "sending mail to #{mail}"
  end
end
