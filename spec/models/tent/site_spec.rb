require 'rails_helper'

RSpec.describe Tent::Site, type: :model do

  before do
    @site = build :tent_site
  end

  subject { @site }

  it { should respond_to(:path) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:logo_url) }
  it { should respond_to(:note) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  it { should be_valid }

  describe '#path' do
    context 'バリデーションする前に' do
      it '小文字になっていればOK' do
        @site.path = 'PATH'
        @site.valid?
        expect(@site.path).to eq 'path'
      end
    end
  end

end
