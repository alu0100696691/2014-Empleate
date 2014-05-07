require 'spec_helper'

describe Contacto do

  before do
    @contacto = Contacto.new(name: "Example User", email: "user@example.com", mensaje: "Example")                     
  end

  subject { @contacto }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:mensaje) }
   
  it { should be_valid }


end
