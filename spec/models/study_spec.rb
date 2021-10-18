require 'rails_helper'

RSpec.describe Study, type: :model do
  before do
    @study = FactoryBot.build(:study)
  end

  describe '投稿の保存' do
    context '投稿ができる場合' do
      it 'タイトルと内容があれば投稿できる' do
        expect(@study).to be_valid
      end
    end

    context '投稿ができない場合'
    it 'タイトルが空では投稿できない' do
      @study.title = ''
      @study.valid?
      expect(@study.errors.full_messages).to include "Title can't be blank"
    end
    it '内容が空では投稿できない' do
      @study.content = ''
      @study.valid?
      expect(@study.errors.full_messages).to include "Content can't be blank"
    end
  end
end
