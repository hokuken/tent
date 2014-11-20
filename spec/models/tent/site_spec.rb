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

    context '空の場合' do
      it 'invalid' do
        @site.path = ''
        expect(@site).not_to be_valid
      end
    end

    context '50文字を超えた場合' do
      it 'invalid' do
        @site.path = 'a' * 51
        expect(@site).not_to be_valid

        @site.path = 'あ' * 51
        expect(@site).not_to be_valid
      end
    end

    context '日本語を使用した場合' do
      it 'OK' do
        jp_strings = %w(
          ぱす
          パス
          サッカー
          ないたー
          愛
          玉ねぎ
          表
          髙島屋
          龠
          人々
          一二三
          ＠
        )
        @site.path = 'パス'
        expect(@site).to be_valid
      end
    end

    context '使用不可の文字を使った場合' do
      it 'invalid' do
        invalid_paths = %w-
          / < > # ? ' " % ! $ & ( ) = ^
          ~ \ | { } [ ] @ ` * + : ; , .
        -
        valid = false
        invalid_paths.each do |c|
          @site.path = c
          expect(@site).not_to be_valid
        end
      end
    end

    context '空白文字が前後にある場合' do
      it '除去' do
        @site.path = '  spaces  '
        @site.valid?
        expect(@site.path).to eq 'spaces'
      end
    end

    context '制御文字を使った場合' do
      context 'バリデーション前に' do
        it '除去' do
          @site.path = "new\nline"
          @site.valid?
          expect(@site.path).to eq "new line"

          @site.path = "contain\ttab"
          @site.valid?
          expect(@site.path).to eq "contain tab"

          @site.path = "\ttab\t"
          @site.valid?
          expect(@site.path).to eq "tab"

          @site.path = "\nnew line\n"
          @site.valid?
          expect(@site.path).to eq "new line"

        end
      end
    end

    context '予約語を指定した場合' do
      pending '予約後のリストを読み込み、ランダムで選んでテストする'
    end
  end

  describe '#title' do
    context '空の場合' do
      it 'invalid' do
        @site.title = ''
        expect(@site).not_to be_valid
      end
    end
  end

end
