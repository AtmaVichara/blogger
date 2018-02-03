require 'rails_helper'

describe Tagging, type: :model do
  describe 'relationships' do
    it { should have_many(:tag)}
    it { should have_many(:article) }
  end
end
