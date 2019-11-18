describe 'Viewing Spaces' do

  it 'returns a list of spaces' do
    conn = PG.connect(dbname: 'party_dino_bnb_test')

    Spaces.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
    Spaces.create(name: 'house', description: 'rural area', price: '£40', available_from: 'November 20 2019', available_to: 'November 30 2019')

    spaces = Spaces.all

    expect(spaces.length). to eq 2
    expect(spaces.first).to be_a Spaces
  end
end
