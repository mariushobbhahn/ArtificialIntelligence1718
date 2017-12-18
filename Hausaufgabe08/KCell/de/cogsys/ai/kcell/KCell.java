package de.cogsys.ai.kcell;

import java.util.List;
import java.util.ArrayList;

import de.cogsys.ai.game.Agent;
import de.cogsys.ai.game.Game;

public class KCell extends Game<Integer,List<Integer>> {

    private int stonesPerPlayer;
    private int boardSize;
	private List<Integer> gameState;
	private int currentPlayer = PLAYER1;

    public static final int EMPTY = -1;

	public static void main(final String[] args) {

		// TODO: (a) Run the game with 2 human/MiniMax players and 7 cells with 2 Stones
		final Agent<Integer,List<Integer>> player1 = new KCellHumanPlayer();
		//final Agent<Integer,List<Integer>> player1 = new MiniMaxAgent<Integer,List<Integer>>();
        final Agent<Integer,List<Integer>> player2 = new KCellHumanPlayer();
		//final Agent<Integer,List<Integer>> player2 = new MiniMaxAgent<Integer,List<Integer>>();


		// TODO: (b) Run the game without heuristic and 7 cells with 2 Stones
		//AlphaBetaAgent<Integer,List<Integer>> player1 = new AlphaBetaAgent<Integer,List<Integer>>();
		//AlphaBetaAgent<Integer,List<Integer>> player2 = new AlphaBetaAgent<Integer,List<Integer>>();

		// TODO: (c) Run the game with heuristics and 15 cells with 3 Stones
		//AlphaBetaAgent<Integer,List<Integer>> player1 = new AlphaBetaAgent<Integer,List<Integer>>(new KCellHeuristic());
		//AlphaBetaAgent<Integer,List<Integer>> player2 = new AlphaBetaAgent<Integer,List<Integer>>(new RandomKCellHeuristic());

		Game.play(
			new KCell(7, 4),
			player1,
            player2
		);
	}


	/**
	 * Constructor
	 */
	public KCell(final int size, final int stones) {
	    assert (size > stones);     // stones have to fit inside of board
        assert (stones % 2 == 0);   // stones has to be even

        boardSize = size;
	    gameState = new ArrayList<>(size);
	    stonesPerPlayer = stones / 2;

	    // Player1 stones
        for (int i = 0; i < stonesPerPlayer; i++) {
            gameState.add(i, PLAYER1);
        }
        // Empty cells
        for (int i = stonesPerPlayer; i < size - stonesPerPlayer; i++) {
            gameState.add(i, EMPTY);
        }
        // Player2 stones
        for (int i = size - stonesPerPlayer; i < size; i++) {
            gameState.add(i, PLAYER2);
        }
	}


    /**
     * Constructor to copy current state
     * @param state current game State
     * @param player current player
     * @param stonesPP #stones
     */
	public KCell (List<Integer> state, int player, int stonesPP) {
	    gameState = state;
	    currentPlayer = player;
	    stonesPerPlayer = stonesPP;
	    boardSize = state.size();
    }


	@Override
	public double evaluate() {
	    if (wins(PLAYER1)){
            return 1;
        }
	    if (wins(PLAYER2)){
            return -1;
        }
	    return 0;
	}


	@Override
	public int getCurrentPlayer() {
		return currentPlayer;
	}


	@Override
	public int getOtherPlayer() {
	    switch (currentPlayer) {
            case PLAYER1: return PLAYER2;
            case PLAYER2: return PLAYER1;
        }
        return 0;
	}

	private void switchPlayer() {
	    currentPlayer = getOtherPlayer();
    }

    /**
     * Returns if player won by moving all pieces to the opposite end
     * @param player PLAYER1 || PLAYER2
     * @return boolean
     */
	private boolean winByAllStones(final int player){
        boolean win = false;

        // Win by moving all pieces to the opposite end
        switch (player){
            case PLAYER1: // all stones on right side
                int startPos = boardSize - stonesPerPlayer;
                win = gameState.get(startPos) == player;

                for (int i = startPos + 1; i < boardSize; i++) {
                    win = win && ((gameState.get(i)) == player);
                }
                break;

            case PLAYER2: // all stones on left side
                win = (gameState.get(0)) == player;
                for (int i = 1; i < stonesPerPlayer; i++) {
                    win = win && ((gameState.get(i)) == player);
                }
                break;
        }
        return win;
    }

    /**
     * Returns if player won because he has more stones at the opposite end,
     * but only if the are no moves left
     * @param player PLAYER1 || PLAYER2
     * @return boolean
     */
    private boolean winByNoMoves(final int player) {
        // Count points for PLAYER1
        int p1Points = 0;
        for (int i = boardSize - 1; i >= boardSize - stonesPerPlayer; i--) {
            if (gameState.get(i) == PLAYER1)
                p1Points++;
            else
                break;
        }

        // Count points for PLAYER2
        int p2Points = 0;
        for (int i = 0; i < stonesPerPlayer; i++) {
            if (gameState.get(i) == PLAYER2)
                p2Points++;
            else
                break;
        }

        // return winner based on player
        switch (player) {
            case PLAYER1: return p1Points > p2Points;
            case PLAYER2: return p2Points > p1Points;
        }
        return false;
    }

	@Override
	public boolean wins(final int player) {
        // Always check
	    if (winByAllStones(player))
	        return winByAllStones(player);
        // Only check if no more moves possible
        return (noMoreValidMoves()) && winByNoMoves(player);
	}


    /**
     * Returns if BOTH players have no valid move, but the Empty move left
     * @return boolean
     */
	private boolean noMoreValidMoves() {
        boolean res = generateValidMoves().isEmpty();
        switchPlayer();
        res = res && generateValidMoves().isEmpty();
        switchPlayer();
        return res;
    }


	@Override
	public boolean ends() {
	    return wins(PLAYER1) || wins(PLAYER2) || noMoreValidMoves();
	}


    /**
     * Returns if a regular move by one at position 'move' is possible
     * @param move the position to be moved
     * @return boolean
     */
	private boolean isNextFree(final int move, final int player) {
	    int right = move + 1;
	    int left = move - 1;
        switch (player) {
            case PLAYER1:
                if (right < boardSize)
                    return gameState.get(right) == EMPTY;
                break;
            case PLAYER2:
                if (left >= 0)
                    return gameState.get(left) == EMPTY;
                break;
        }
        return false;
    }


    /**
     * Returns if a skipping-move at position 'move' is possible
     * @param move the position to be moved
     * @return boolean
     */
	private boolean isNextSkippable(final int move, final int player) {
	    int rightmostPos = boardSize - 3;
	    int leftmostPos = 2;
	    int right = move + 1;
	    int left = move - 1;

        switch (player) {
            case PLAYER1:
                if (move <= rightmostPos)
                    return !isNextFree(move, player) && isNextFree(right, player);
                break;
            case PLAYER2:
                if (move >= leftmostPos)
                    return !isNextFree(move, player) && isNextFree(left, player);
                break;
        }
        return false;
    }


    /**
     * Returns if the player can move at position 'move'
     * @param move the position to be moved
     * @return boolean
     */
    private boolean isMovable(final int move, final int player) {
        return isNextFree(move, player) || isNextSkippable(move, player);
    }


    /**
     * Returns if the currentPlayer is allowed to move at position 'move'
     * @param move the position to be moved
     * @return boolean
     */
    private boolean isCorrectPlayer(final int move, final int player) {
        return (gameState.get(move) == player);
    }


	@Override
	public boolean isValidMove(final Integer move) {
        boolean res = move >= 0 && move < boardSize;

        // not-Empty move
        if (res)
            return isCorrectPlayer(move, currentPlayer) && isMovable(move, currentPlayer);

        // Empty move only allowed
        return (move == EMPTY) && generateValidMoves().isEmpty() && !noMoreValidMoves();
    }


	@Override
	public List<Integer> generateValidMoves() {
	    ArrayList<Integer> validMoves = new ArrayList<>(stonesPerPlayer);

	    for (int i = 0; i < boardSize; i++) {
	        if (isValidMove(i))
	            validMoves.add(i);
        }
		return validMoves;
	}


	@Override
	public List<Integer> getGameState() {
		return gameState;
	}

    /**
     * Moves stone from start to target
     * @param start the stone to be moved
     * @param target where the stone will be moved to
     */
	private void moveStone(List<Integer> state, int start, int target) {
        state.set(target, currentPlayer);
        state.set(start, EMPTY);
    }

	
	@Override
	public Game<Integer,List<Integer>> performMove(final Integer move) {
        int player = currentPlayer;
        int target = move;

	    // Copy which is to be returned
        KCell copy = new KCell(gameState, getOtherPlayer(), stonesPerPlayer);

        // "empty move" checking
        if (move == EMPTY)
            return copy;

        // "Move by one" checking
        if (isNextFree(target, player)) {
            switch (player) {
                case PLAYER1: target++; break;
                case PLAYER2: target--; break;
            }
            moveStone(copy.gameState, move, target);
            return copy;
        }

        // "Skip and Skip-Chain" checking
        while(isNextSkippable(target, player)) {
            switch (player) {
                case PLAYER1: target += 2; break;
                case PLAYER2: target -= 2; break;
            }
            assert (gameState.get(target) == EMPTY);
            moveStone(copy.gameState, move, target);
        }

        return copy;
	}


	@Override
	public String computeStringRepresentation() {
	    StringBuilder board = new StringBuilder("[");
	    for (int i = 0; i < boardSize; i++) {
	        switch (gameState.get(i)) {
                case EMPTY:
                    board.append("_");
                    break;
                case PLAYER1:
                    board.append("o");
                    break;
                case PLAYER2:
                    board.append("x");
                    break;
            }
        }
        board.append("]");
		return board.toString();
	}
}