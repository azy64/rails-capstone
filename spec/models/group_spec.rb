require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'Henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(name: 'Chapo', icon: 'grams.png')
    expect(@group).to be_valid
  end

  it 'invalid if name absent' do
    @user = User.create!(name: 'henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(icon: 'grams.png')
    expect(@group).to_not be_valid
  end

  it 'Must be associated with a user' do
    @user = User.create!(name: 'Henry eze', email: 'henryeze@gmail.com', password: 'kkkkkkUYT')
    @group = Group.create(name: 'Chapo11', icon: 'grams.png', user: @user)
    expect(@group).to be_valid
  end

  it 'not valid if icon is absent' do
    @group = Group.create(name: 'Chapo11')
    expect(@group).to_not be_valid
  end
end
