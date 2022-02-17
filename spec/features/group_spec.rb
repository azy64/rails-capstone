require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Henry', email: '1@4.com', password: 'kkkkkk')
    @group = Group.create(name: 'Mukimo', icon: 'ppp.png', user: @user)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit groups_path
  end

  scenario 'show My groups on page' do
    expect(page).to have_content 'GROUPS'
  end

  scenario 'show group details on page' do
    expect(page).to have_content @group.name
    # expect(page).to have_content 'ppp.png'
  end

  scenario 'show Add Group button on page' do
    expect(page).to have_link 'add a new category'
  end

  scenario 'Should display a delete button' do
    expect(page).to have_link 'LOG OUT'
  end
end
