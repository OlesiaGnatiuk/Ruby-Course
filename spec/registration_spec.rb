feature 'Registration', js: true do

  let!(:timestamp) {Time.now.to_i.to_s}
  let!(:email) {"test" + timestamp + "@gmail.com"}
  let!(:user_name) {"test" + timestamp}

  scenario 'User can register now' do


    visit('https://gitlab.testautomate.me/')
    find(:xpath, '//*[@id="signin-container"]/p/a').click
    find('#new_user_first_name').set 'test123g45'
    find('#new_user_last_name').set 'test12345'
    find('#new_user_username').set user_name
    find('#new_user_email').set email
    find('#new_user_password').set 'test7123456'
    find('.btn.gl-button.gl-w-full').click

    select('Development Team Lead', from: "Role")
    select('A different reason', from: "I'm signing up for GitLab because:")

    find('.gl-button.w-100').click


    expect(page).to have_content ('Welcome to GitLab')

     sleep 5

    end
end

