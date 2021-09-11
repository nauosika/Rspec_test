require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { create(:role) }

  describe 'associations' do
    it { should have_many(:swords) }
    it { should have_many(:items).through(:boxes) }
    it { should belong_to(:user) }
    it { should have_one(:skill) }
  end

  describe "測試驗證功能" do
    context "欄位限制" do
      it "name不可以空白" do
        role.name = nil
        expect(role).to_not be_valid
      end

      it "job不可以空白" do
        role.job = nil
        expect(role).to_not be_valid
      end

      it "age不可以空白" do
        role.age = nil
        expect(role).to_not be_valid
      end

      it "name不能取太長" do
        role.name = 'a' * 11
        expect(role).to_not be_valid
      end

      it "job不能太短" do
        role.job = 'a'
        expect(role).to_not be_valid
      end

      it "age只能數字" do
        role.age = "數字"
        expect(role).to_not be_valid
      end

    end
  end
end