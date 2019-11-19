describe 'Viewing Spaces' do

  before(:each) do
    conn = PG.connect(dbname: 'party_dino_bnb_test')

    @space1 = Spaces.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
    @space2 = Spaces.create(name: 'house', description: 'rural area', price: '£40', available_from: 'November 20 2019', available_to: 'November 30 2019')
  end

  it 'returns a list of spaces' do
    spaces = Spaces.all

    expect(spaces.length). to eq 2
    expect(spaces.first).to be_a Spaces
  end

  it 'can find a specific space' do
    findspace = Spaces.find('name', 'home')
    expect(findspace.name).to eq 'home'
  end

  it 'can update a specific space' do
    updated_space = Spaces.testupdate(name: 'bungalow', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
    expect(updated_space.name).to eq 'bungalow'
  end
end
