require 'tlsmail'
require 'time'

content = <<EOF


How are you vasu :).
EOF
puts "sending mail....."
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', 'shaunakv1@gmail.com', 'Vaidhvai_22', :login) do |smtp|
  smtp.send_message(content, 'shaunakv1@gmail.com', 'vasundharadsingh@gmail.com')
end
puts "mail Sent!!"