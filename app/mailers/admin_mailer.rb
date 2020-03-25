class AdminMailer < Devise::Mailer
    default from: 'no-reply@unh.edu'
    layout 'mailer'

    def new_user_waiting_for_approval(email)
      @email = email
      mail(to: 'suzanne.vogt@unh.edu', subject: 'New User Awaiting Admin Approval')
    end

    def new_user_approved(email)
      @email = email
      mail(to: @email, subject: "Your account has been approved for: #{Rails.application.config.action_mailer.default_url_options[:host]}")
    end
end
