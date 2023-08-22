require './lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    # No tests necessary
  end
end

describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    context "when a new board is created" do
      matcher :be_empty do
        match { |cell| cell == ' ' }
      end

      it 'is an empty board' do
        board_cells = new_board.board.flatten
        expect(board_cells).to all(be_empty)
      end
    end
  end

  describe '#update_board' do
    subject(:update_board_game) { described_class.new }

    context "when a player makes a selection" do
      it "updates the board with a token" do
        index = 4
        token = 'X'
        update_board_game.update_board(index, token)
        expect(update_board_game.board[4]).to eq('X')
      end
    end
  end

  describe 'display_board' do
    # No tests necessary
  end
end

describe Game do
  describe '#initialize' do
    # No tests necessary
  end

  describe '#space_not_taken?' do
    subject(:game_space) { described_class.new }

    context "when a space selected is not taken" do
      before do
      end

      xit "returns true" do
      end
    end

    context "when a space selected is taken" do
      before do
      end

      xit "return false" do
      end
    end
  end

  describe '#valid_move?' do
    subject(:move_valid) { described_class.new }

    context "when a player's move is valid" do
      before do
        valid_move = 3
        allow(:move_valid).to receive(:gets).and_return(valid_move)
      end

      xit "returns true" do
      end
    end

    context "when a player's move is invalid" do
      before do
        invalid_move = 15
        allow(:move_valid).to receive(:gets).and_return(invalid_move)
      end

      xit "returns false" do
      end
    end
  end

  describe '#current_player' do
    subject(:game_player) { described_class.new }

    context "when the current player is player one" do
      before do
      end

      xit "returns 'X' token" do
      end
    end

    context "when the current player is player two" do
      before do
      end

      xit "returns 'O' token" do
      end
    end
  end

  describe '#move' do
    subject(:game_move) { described_class.new }
    let(:board_move) { instance_double(Board) }

    context "when the turn number is odd" do
      before do
        move_turn = 3
       
      end

      xit "current player is 'X'" do
        expect(current_player).to eq('X')
      end
    end

    context "when the turn number is even" do
      before do
        move_turn = 6
        
      end

      xit "current player is 'O'" do
      end
    end
  end

  describe '#player_turn' do
    subject(:game_turn) { described_class.new }
    let(:board_turn) { instance_double(Board) }

    context "when valid move is true" do
      xit "updates the board with an 'X'" do
      end

      xit "updates the board with an 'O'" do
      end

      xit "increases turn count by 1" do
      end
    end
  end

  describe '#win' do
    subject(:game_win) { described_class.new }
    let(:board_win) { instance_double(Board) }

    context "when player one wins with 'X's horizontally accross the top row" do
      xit "returns winner" do
      end
    end

    context "when player two wins with 3 'O's diagonally" do
      xit "returns winner" do
      end
    end

    context "when player one wins with 3 'X's vertically on the right" do
      xit "returns winner" do
      end
    end
  end

  describe '#winner' do
    subject(:game_winner) { described_class.new }

    context "when 'X' wins" do
      xit "player one is congratulated" do
      end
    end

    context "when 'O' wins" do
      xit "player two is congratulated" do
      end
    end
  end

  describe '#draw' do
    subject(:game_draw) { described_class.new }

    context "when the turn number reaches 10 and no one wins" do
      before do
      end

      xit "It's a draw" do
      end
    end
  end

  describe 'over' do
    subject(:game_over?) { described_class.new }

    context "when the game is a draw" do
      xit "returns true" do
      end
    end

    context "when player one wins" do
      xit "returns true" do
      end
    end

    context "when player two wins" do
      xit "returns true" do
      end
    end

    context "when the game is not over" do
      xit "returns false" do
      end
    end
  end

  describe 'play' do
    subject(:game_play) { described_class.new }

    context "when the game is not over" do
      xit "move returns true" do
      end
    end

    context "when the game is over" do
      xit "move returns false" do
      end
    end
  end
end