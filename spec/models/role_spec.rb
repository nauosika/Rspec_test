require 'rails_helper'

RSpec.describe Role, type: :model do

  describe "測試驗證功能" do   #能越清楚越好，英文不好所以我用中文。
    context "所有欄位不能空白" do

      let(:role) {Role.new}

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
    end
  end
end