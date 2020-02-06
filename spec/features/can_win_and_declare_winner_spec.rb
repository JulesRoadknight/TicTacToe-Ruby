require 'game'

# frozen_string_literal: true

describe Game do
  before(:each) do
    @game = Game.new
  end

  it 'Can win diagonally falling' do
    allow(@game.board).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
    @game.go
    expect(@game.winner).to be true
  end

  it 'Can win diagonally rising' do
    allow(@game.board).to receive(:gets).and_return('9', '5', '2', '7', '1', '4', '6', '3', '8')
    @game.go
    expect(@game.winner).to be true
  end

  it 'Can win a row' do
    allow(@game.board).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    @game.go
    expect(@game.winner).to be true
    expect { @game.go }.to output("O is the winner!\n").to_stdout
  end

  it 'Can win a column' do
    allow(@game.board).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    @game.go
    expect(@game.winner).to be true
  end
end
