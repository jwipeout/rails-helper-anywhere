require 'spec_helper'

RSpec.describe RailsHelperAnywhere do
  it 'has a version number' do
    expect(RailsHelperAnywhere::VERSION).not_to be nil
  end

  describe '#method_missing' do
    it 'returns link to home page' do
      expect(Helper.link_to('home page', '/')).to eq('<a href="/">home page</a>')
    end

    it 'returns path to pins #index' do
      expect(Helper.pins_path).to eq('/pins')
    end

    it 'returns dollar formatted number' do
      expect(Helper.number_to_currency(9.99)).to eq('$9.99')
    end

    it 'returns string from application helper method #from_app_helper' do
      expect(Helper.from_app_helper).to eq('Method in application helper')
    end

    it 'returns super method missing' do
      expect { Helper.no_method }.to raise_error(NoMethodError)
    end
  end

  describe '#respond_to_missing' do
    it 'returns true for link_to method' do
      expect(Helper.respond_to_missing?(:link_to)).to eq(true)
    end

    it 'returns true for pins_path method' do
      expect(Helper.respond_to_missing?(:pins_path)).to eq(true)
    end

    it 'returns true for number_to_currency method' do
      expect(Helper.respond_to_missing?(:number_to_currency)).to eq(true)
    end

    it 'returns true for from_app_helper method' do
      expect(Helper.respond_to_missing?(:from_app_helper)).to eq(true)
    end

    it 'returns false for no_method method' do
      expect(Helper.respond_to_missing?(:no_method)).to eq(false)
    end
  end
end
