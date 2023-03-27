class RegistrationPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_up'

  element :first_name, '#new_user_first_name'
  element :last_name, '#new_user_last_name'
  element :user_name, '#new_user_username'
  element :email, '#new_user_email'
  element :password, '#new_user_password'
  element :registration_button, '.btn.gl-button.gl-w-full'

 # element :role, :dqs, 'role_dropdown'
 # element :reason, '#user_registration_objective'
 # element :reason_optional, '#jobs_to_be_done_other'

  element :get_started_button, '.gl-button.w-100'
end