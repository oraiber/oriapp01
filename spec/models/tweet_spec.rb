require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'テキストを投稿できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'テキストが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'テキストが500文字以内でないと投稿できない' do
        @tweet.text = '500文字以上' * 500
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Text is too long (maximum is 500 characters)')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
