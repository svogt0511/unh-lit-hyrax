class AdminMailer < Devise::Mailer
    default from: 'no-reply@unh.edu'
    layout 'mailer'

    def new_user_waiting_for_approval(email)
      @email = email
      mail(to: 'suzanne.vogt@unh.edu', subject: 'New User Awaiting Admin Approval')
    end
end
