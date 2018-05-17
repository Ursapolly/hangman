require 'game'

describe Game do
  it 'user wins' do
    game = Game.new('тест')
    expect(game.status).to eq :in_progress

    game.next_step 'т'
    game.next_step 'с'
    game.next_step 'е'

    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end

  it 'user loses' do
    game = Game.new('лето')
    expect(game.status).to eq :in_progress

    game.next_step 'е'
    game.next_step 'в'
    game.next_step 'а'
    game.next_step 'й'
    game.next_step 'я'
    game.next_step 'н'
    game.next_step 'ю'
    game.next_step 'д'

    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
  end
end