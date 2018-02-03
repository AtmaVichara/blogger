require 'rails_helper'

describe Tag, type: :model do
  describe 'relationships' do
    it { should have_many(:tagging) }
    it { should have_many(:article).through(:tagging) }
  end
end
