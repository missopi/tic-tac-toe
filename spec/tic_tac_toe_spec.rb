require './lib/tic_tac_toe'

describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    context 'when a new board is created' do
      matcher :be_empty do
        match { |cell| cell == ' ' }
      end

      it 'is an empty board' do
        board_cells = new_board.board
        expect(board_cells).to all(be_empty)
      end
    end
  end

  describe '#update_board' do
    subject(:update_board_game) { described_class.new }

    context 'when a player makes a selection' do
      it 'updates the board with a token' do
        index = 4
        token = 'X'
        update_board_game.update_board(index, token)
        expect(update_board_game.board[4]).to eq('X')
      end
    end
  end
end

describe Game do
  describe '#win' do
    subject(:game_win) { described_class.new }
    let(:board_win) { instance_double(Board) }

    before do
      allow(game_win).to receive(:move)
      value = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      game_win.instance_variable_set(:@board, value)
    end

    context "when player wins with 'X's horizontally along the top row" do
      it 'returns true' do
        result = game_win.win
        expect(result).to be true
      end
    end

    before do
      value = [' ', ' ', 'O', ' ', 'O', ' ', 'O', ' ', ' ']
      game_win.instance_variable_set(:@board, value)
    end

    context "when player wins with 3 'O's diagonally" do
      xit 'returns true' do
        result = game_win.win
        expect(result).to be true
      end
    end

    before do
      value = [' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', 'X']
      game_win.instance_variable_set(:@board, value)
    end

    context "when player only has 2 'X's vertically on the right" do
      xit 'returns false' do
        result = game_win.win
        expect(result).to be false
      end
    end
  end
end
