# = TEST PAGINAS ESTATICAS PROYECTO: home page
require 'spec_helper'

describe "Static pages" do	
	describe "Home page" do
	
		describe "for signed-in users" do
     		   let(:user) { FactoryGirl.create(:user) }
      		   before do
        		FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        		FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        		sign_in user
        		visit root_path
      		end

     		 it "should render the user's feed" do
        		user.feed.each do |item|
          		  expect(page).to have_selector("li##{item.id}", text: item.content)
        		end
      		end

      		describe "follower/following counts" do
        		let(:other_user) { FactoryGirl.create(:user) }
        		before do
          			other_user.follow!(user)
          			visit root_path
        		end
			it "following" do
			expect(page).to have_content('0 following')
			end
			it "followers" do
                         expect(page).to have_content('1 followers')
                        end

      		end

    	end
	end
  	describe "Log in" do

    		it "should have the content 'Login'" do
      		visit '/static_pages/login'
      		expect(page).to have_content('Login')
    		end
  	end

	describe "Registro" do

      		before { visit '/users/new' }
    		it { expect(page).to have_title('REGISTRO') }
  	end

	describe "Acerca de" do

   		it "should have the content 'Acerca de'" do
      		visit '/static_pages/about'
      		expect(page).to have_content('Acerca de')
    		end
  	end
	

        describe "Contacto" do

                it "should have the content 'Contacto'" do
                visit '/static_pages/contact'
                expect(page).to have_content('Contacto')
                end
        end


end

