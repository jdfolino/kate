# frozen_string_literal: true

require_relative './../lib/kate'
describe 'Smoke Test' do
  describe Kate::Kubectl do
    before(:all) do
      Kate::Kubectl.destroy_all
      Kate::Kubectl.create("#{Dir.pwd}/spec/fixtures/svc.yaml")
    end

    after(:all) do
      Kate::Kubectl.destroy_all
    end

    it 'does something ' do
      expect(Kate::Kubectl.services.size).to eq(1)
    end
  end
end
