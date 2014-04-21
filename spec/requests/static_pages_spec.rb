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

