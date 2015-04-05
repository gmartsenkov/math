require 'spec_helper'

describe FirstGem do
  it 'has a version number' do
    expect(FirstGem::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
