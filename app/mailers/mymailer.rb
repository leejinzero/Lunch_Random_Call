class Mymailer < ApplicationMailer
  def support from, title ,content
    mail from: from,
           to: 'wldns8656@gmail.com',
      subject: title,
         body: content
  end
end
