require "spec_helper"

RSpec.describe RailsHelperAnywhere do
  it "has a version number" do
    expect(RailsHelperAnywhere::VERSION).not_to be nil
  end

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
end
