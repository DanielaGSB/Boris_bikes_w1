require 'bike'

describe Bike do
  it 'confirms that bike is working' do
    expect(subject).to respond_to :working?
  end
  it 'allows user to report bike as broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
