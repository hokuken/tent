require 'rails_helper'

RSpec.describe Tent::Page, type: :model do

  before do
    @page = build :tent_page
  end

  subject { @page }

  it { should respond_to(:site_id) }
  it { should respond_to(:path) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  it { should belong_to :site }

  it { should be_valid }
end
