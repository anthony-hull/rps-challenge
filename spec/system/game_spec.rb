require './lib/game.rb'
describe Game do

  let(:player1) {spy(:player1, name: 'Anthony')}
  it 'returns player username' do
    subject.add_player(player1)
    subject.playername
    expect(player1).to have_received(:username)
  end

  it  'returns the turn choice' do
    subject.move = 'rock'
    expect(subject.move).to eq('rock')
  end

  it 'returns a random turn for the computer' do
    expect( %w[rock paper scissors] ).to include(subject.ai_move)
  end

  it 'returns AI won the game' do
    subject.add_player(player1)
    subject.move = 'scissors'
    expect(subject.who_wins?).to eq(Game::AI_WINS)
  end

  it 'returns Player1 won the game' do
    subject.add_player(player1)
    subject.move = 'paper'
    expect(subject.who_wins?).to eq(Game::PLAYER_1_WINS)
  end

  it 'returns Player1 won the game' do
    subject.add_player(player1)
    subject.move = 'scissors'
    expect(subject.who_wins?).to eq(Game::DRAW)
  end
end
