require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { described_class.new(first_name: "test", last_name: "doe", email: "john@doe.com", password_digest: "test") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
	it "has many tasks" do
		assc = described_class.reflect_on_association(:tasks)
		expect(assc.macro).to eq :has_many
	end
  end

  describe "Uniqueness" do
	# let(:fake_doe) { described_class.new(email: "john@doe.com", password_digest: "test") }
  	it "cannot have the same email as a pre-existing user" do
  		subject.save!
  		fake_doe = described_class.new(email: "john@doe.com", password_digest: "test")
  		expect(fake_doe).to_not be_valid
  	end
  end
end

