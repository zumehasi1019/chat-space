require 'rails_helper'
describe MessagesController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:message) {FactoryGirl.create(:message)}
  let(:group) {FactoryGirl.create(:group)}


  describe 'GET #index' do
    before do
      login_user user
    end

    it "renders the :index template" do
    end

    it "assigns the requested tweet to @current_group" do
      get :index, group_id: group
      expect(assigns(:current_group)).to eq group
    end

    it "assigns the requested tweet to @current_message" do
      get :index, group_id: group
      expect(assigns(:current_message)).to be_a_new(Message)
    end
  end

  describe 'GET #index' do
    it "if user is not signed in redirected to the :index template " do
      get :index, group_id: group
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    it "saves new message to database when user is signed in"  do
      expect{post :create, group_id: group, message: attributes_for(:message)}.to change(Message, :count).by(1)
    end

    it "redirect to create template" do
      post :create, group_id: group, message: attributes_for(:message)
      expect(response).to redirect_to(group_messages_path)
    end

it "could not save a message in the database when a user is signed in" do
      expect{post :create, group_id: group, message: attributes_for(:message, detail:nil, image:nil)}.not_to change(Message,:count)
    end

    it " it could not save a message renders the :index template" do
        post :create, group_id: group, message: attributes_for(:message, detail: nil, image: nil)
        expect(response).to redirect_to(group_messages_path)
      end
    end

  describe 'POST #create' do
    it "redirect when a user isn't signed in tries to send a message" do
      post :create, group_id: group, message: attributes_for(:message)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

