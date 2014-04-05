require 'spec_helper'

describe "Static pages" do

  	describe "Log in" do

    		it "should have the content 'Login'" do
      		visit '/static_pages/login'
      		expect(page).to have_content('Login')
    		end
  	end

	describe "Registro" do

    		it "should have the content 'REGISTRO'" do
      		visit '/users/new'
      		expect(page).to have_content('REGISTRO')
    		end
  	end
	

end

