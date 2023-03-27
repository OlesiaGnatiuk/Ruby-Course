feature 'Registration', js: true do
  scenario 'User can register now' do

  user_name = "test#{Time.now.to_i.to_s}"
  email = "#{user_name}@example.com"

  @register_page = RegistrationPage.new
  @register_page.load

  @register_page.first_name.set 'Test'
  @register_page.last_name.set 'User'
  @register_page.user_name.set user_name

  expect(page).to have_selector '.validation-success.field-validation'

  @register_page.email.set email
  @register_page.password.set 'test123456'
  @register_page.registration_button.click

  select('Development Team Lead', from: "Role")
  select('A different reason', from: "I'm signing up for GitLab because:")
  find(:xpath, '//*[@id="jobs_to_be_done_other"]').set 'Reason'  if find(:xpath, '//*[@id="jobs_to_be_done_other"]').visible?

  @register_page.get_started_button.click

  expect(page).to have_content 'Welcome to GitLab'

  sleep 3

    end
end

