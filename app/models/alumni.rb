class Alumni < ActiveRecord::Base

  def random_string(length=10)
      chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
      password = ''
      length.times { password << chars[rand(chars.size)] }
      password
  end
  
  def self.export
    Alumni.all.each do |a|
      if a.mail.length > 4
        pass = ''
        chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
        10.times { pass << chars[rand(chars.size)] }
        
        @user = User.create(:username => a.mail.downcase, :password => pass, :password_confirmation => pass)
        if @user.id
          puts "#{a.mail.downcase} -> #{pass}\n <br/>"
          @info = AccountInformation.new
          @info.user_id = @user.id
          @info.email = a.mail.downcase
          @info.nume = a.nume
          @info.prenume = a.prenume
          @info.adresa = a.adresa
          @info.domeniucurent = a.domeniu
          @info.promotia = a.promotia
          @info.specializare = ""
          @info.cariera = a.cariera
          @info.mentor = a.mentor
          if @info.save
            puts "    - account info successfuly saved <br/>\n"
            Notifier.deliver_generated(a.mail.downcase,pass)
          end
        else
          puts "could not create -> #{a.mail.downcase} <br/>\n"
        end
      else
        puts "no email for #{a}<br/>\n"
      end
    end
  end
        
end
