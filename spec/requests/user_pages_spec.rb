require 'spec_helper'

describe "User pages" do

  subject { page }

	
	describe "Registro" do

                it "should have the content 'REGISTRO'" do
                visit '/users/new'
                expect(page).to have_content('REGISTRO')
                end
        end


	describe "profile page" do
  		let(:user) { FactoryGirl.create(:user) } #para usar el fichero spec/factory.rb en el test	
		before { visit user_path(user) }

  			it { should have_content(user.name) }
  			it { should have_title(user.name) }
	end


end


