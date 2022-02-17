require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'Henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(name: 'ADIDAS6GROUP', icon: 'grams.png')
    @entity = @group.entities.create(name: 'Chapo', amount: 30.0, user: @user)
    expect(@entity).to be_valid
  end

  it 'invalid if name absent' do
    @user = User.create!(name: 'Henry', email: 'henryb@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(name: 'Blaser-group', icon: 'grams.png')
    @entity = @group.entities.create(amount: 1230)
    expect(@entity).to_not be_valid
  end

  it 'Must be associated with a Group and a User' do
    @entity = Entity.create(name: 'Chapo', amount: 1230)
    expect(@entity).to_not be_valid
  end

  it 'not valid if icon is not present' do
    @user = User.create!(name: 'Henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(icon: 'ppppp.png', name: 'PALAL')
    @entity = @group.entities.create(name: 'Chapo')
    expect(@entity).to_not be_valid
  end

  it 'not valid if amout is not present' do
    @user = User.create!(name: 'Henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @group = @user.groups.create(name: 'MALIK6GROUP', icon: 'grams.png')
    @entity = @group.entities.create(name: 'Chapo', amount: 1230)
    expect(@entity).to_not be_valid
  end
end
