package de.cogsys.ai.kcell;


import java.util.List;

import de.cogsys.ai.game.AlphaBetaHeuristic;
import de.cogsys.ai.game.Game;

public class KCellHeuristic implements AlphaBetaHeuristic<Integer,List<Integer>> {
	private int player;

	public KCellHeuristic(){
	}

	@Override
	public boolean cutoff(Game<Integer,List<Integer>> game, int depth) {
        return depth == 0;
	}

	@Override
	public double eval(Game<Integer,List<Integer>> game) {
        // average distance of your pieces to the other side
        KCell kcellgame = (KCell) game;
        player = kcellgame.getCurrentPlayer();

        int size = kcellgame.getBoardSize();
        double heuristic = 0;

        // Add own stones
        for (int position = 0; position < size; position++) {
            if (kcellgame.isCorrectPlayer(position, kcellgame.getCurrentPlayer())) {
                switch (player) {
                    case Game.PLAYER1:
                        heuristic += position;
                        break;
                    case Game.PLAYER2:
                        heuristic += (size - position);
                        break;
                }
            }
        }

        heuristic /= size;
        return heuristic;
	}
}
