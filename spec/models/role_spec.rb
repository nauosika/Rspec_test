require 'rails_helper'

RSpec.describe Role, type: :model do
  let!(:role) { create(:role) }
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

  describe "#attack_power" do
    it "基本攻擊力等於力量*10" do
      expect(role.attack_power).to be(role.power * 10)
    end

    it "力量是6基本攻擊力為60" do
      role.power = 6
      expect(role.attack_power).to be(60)
    end

    it "力量是4基本攻擊力為40" do
      role.power = 4
      expect(role.attack_power).to be(40)
    end

    # it "武器DPS是所持sword的dps" do
    #   expect(role.sword_dps).to be(role.swords.first.dps)
    # end

    # it "min = 2 , max = 4 , dps = 3" do
    #   role.swords.first.min_damge = 2
    #   role.swords.first.max_damge = 4
    #   expect(role.sword_dps).to be(3)
    # end

    # it "真正攻擊力等基本攻擊力*武器DPS" do
    #   expect(role.really_attack_power).to be(role.attack_power * role.sword_dps)
    # end

    it "力量4 武器min:2, max:5 真正攻擊力120" do
      role.power = 4
      role.swords.first.min_damge = 2
      role.swords.first.max_damge = 5
      expect(role.really_attack_power).to be 120
    end
  end

  describe "#call_back before_update" do
    it "素質更改後，攻擊力會更改" do
      create(
        :role,
        name: "測試用",
        job: "戰士",
        age: "29",
        power: "6",
        attack_power: nil,
        really_attack_power: nil
      )
      role.power = 5
      role.save
    expect(role.attack_power).to be(50)
    end
  end
end