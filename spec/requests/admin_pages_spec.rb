require 'spec_helper'

describe "AdminPages" do

	subject { page }
  
  describe "index" do
  	before { visit admins_path }

  	it { should have_selector('title', text: 'Admin') }
  end
end
