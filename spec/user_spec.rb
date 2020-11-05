require "./lib/User"

RSpec.describe User do
  let(:name) { "Ben" }
  let(:birthday) { Date.new(2000, 1, 1) }
  subject { described_class.new(name, birthday) }

  describe "# Initializer method" do
    it "receives two arguments" do
      expect(User).to respond_to(:new).with(2).arguments
    end

    it "does not work with wrong number of arguments" do
      expect(User).not_to respond_to(:new).with(0).arguments
    end

    it " receives Date object" do
      expect(birthday).to be_an_instance_of(Date)
    end

    it "initializes with valid arguments" do
      pending "cannot find valid? matcher"
      expect(subject).to be_valid?
    end
  end #initialize method end

  describe "# Age method" do
    context "if age is under a year old" do
      user = User.new(name, Date.new(2020, 10, 05))
      it "returns under a year old" do
        expect(user.age).to eq("Under a year old!")
      end
    end

    context "if date is in the future" do
      user = User.new(name, Date.new(2021, 10, 05))
      it "returns Congratulations!" do
        expect(user.age).to eq("Congratulations!")
      end
    end

    context "if age is older than a year" do
      user = User.new(name, Date.new(2018, 10, 05))
      it " returns age by years" do
        expect(user.age).to eq(2)
      end
    end
  end # age method end

  describe "# next_birthday method" do
    context "if today is their birthday" do
      user = User.new(name, Date.new(1990, 11, 05))
      it "returns 'Happy Birthday!" do
        expect(user.next_birthday).to eq("Happy Birthday!")
        expect(user.next_birthday).to be_an_instance_of(String)
      end
    end

    context "if their birthday is this year" do
      user = User.new(name, Date.new(1990, 12, 30))
      it "returns Date object for this year " do
        expect(user.next_birthday).to eq(Date.new(2020, 12, 30))
        expect(user.next_birthday).to be_an_instance_of(Date)
      end
    end

    context "if their birthday is next year" do
      user = User.new(name, Date.new(1990, 10, 30))
      it "returns Date object for next year if birthday has passed" do
        expect(user.next_birthday).to eq(Date.new(2021, 10, 30))
        expect(user.next_birthday).to be_an_instance_of(Date)
      end
    end
  end # next_birthday method end

  describe "# days until next birthday" do
  end
end # RSpec describe end
