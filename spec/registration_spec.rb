feature 'Registration', js: true do

  scenario 'User can register now' do

  user_name = "test#{Time.now.to_i.to_s}"
  email = "#{user_name}@example.com"

    visit('https://gitlab.testautomate.me/')
    find(:xpath, '//*[@id="signin-container"]/p/a').click
    find('#new_user_first_name').set 'Test'
    find('#new_user_last_name').set 'User'
    find('#new_user_username').set user_name
    find('#new_user_email').set email
    find('#new_user_password').set 'test7123456'
    find('.btn.gl-button.gl-w-full').click

    select('Development Team Lead', from: "Role")
    select('A different reason', from: "I'm signing up for GitLab because:")

    find(:xpath, '//*[@id="jobs_to_be_done_other"]').set 'Reason'  if find(:xpath, '//*[@id="jobs_to_be_done_other"]').visible?
    find('.gl-button.w-100').click

    expect(page).to have_content ('Welcome to GitLab')

    sleep 5

    end
end

