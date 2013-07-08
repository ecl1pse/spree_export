require 'spec_helper'

describe Spree::User do
  before do
    create_list(:user, 2)
  end

  let(:users) { Spree::User.order("created_at") }
  let(:user) { users.first }

  describe "self.export_csv" do
    let(:csv) { users.export_csv }
    subject { csv }

    it { should include("id,email,login") }
    it { should include(user.id.to_s) }
    it { should include(user.email) }
    it { should include(user.login) }
  end

end

