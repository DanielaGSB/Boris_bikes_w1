require 'bike'

describe Bike do
  it 'confirms that bike is working' do
    expect(subject.working?).to eq true
  end
  it 'is of class Bike' do
    expect(subject).to be_instance_of Bike
  end
end
