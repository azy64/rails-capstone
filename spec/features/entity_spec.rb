require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Henry', email: '1@4.com', password: 'kkkkkk')
    @group = Group.create(name: 'Mukimo', icon: 'ppp.png', user: @user)
    @entity = @group.entities.create(name: 'Block', amount: 123, user: @user)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit groups_path
    click_link @group.name
  end

  scenario 'show group\'s name on page' do
    expect(page).to have_content @group.name
  end

  scenario 'show the transaction\'s amount on page' do
    expect(page).to have_content @entity.amount
    # expect(page).to have_content 'ppp.png'
  end

  scenario 'show the transaction\'s name on page' do
    expect(page).to have_content @entity.name
  end

  scenario 'Should display TRANSACTIONS title' do
    expect(page).to have_content 'TRANSACTIONS'
  end

  scenario 'Should display add a new transaction link' do
    expect(page).to have_link 'add a new transaction'
  end
end
