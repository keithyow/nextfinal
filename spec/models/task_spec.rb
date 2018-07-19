require 'rails_helper'

RSpec.describe Task, :type => :model do
	let(:test_user) {User.new(first_name: 'test', last_name: 'test', email: 'test@test.com', password_digest: 'test')}

	subject { test_user.tasks.new(description: "Lorem ipsum") }
	
	describe "Validations" do
  		it "is valid with valid attributes" do
    		expect(subject).to be_valid
  		end

  		it "is not valid without a description" do
  			subject.description = nil
  			expect(subject).to_not be_valid
  		end
  	end

  	describe "Associations" do
  		it "belongs to one user" do
    		assc = described_class.reflect_on_association(:user)
    		expect(assc.macro).to eq :belongs_to
  		end
	end
end
