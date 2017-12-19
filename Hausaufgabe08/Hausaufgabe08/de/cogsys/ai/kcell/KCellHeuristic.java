package de.cogsys.ai.kcell;


import java.util.List;

import de.cogsys.ai.game.AlphaBetaHeuristic;
import de.cogsys.ai.game.Game;

public class KCellHeuristic implements AlphaBetaHeuristic<Integer,List<Integer>> {
	@Override
	public boolean cutoff(Game<Integer,List<Integer>> game, int depth) {
		//
		// implement me
		//
		return false;
	}
	@Override
	public double eval(Game<Integer,List<Integer>> game) {
		//
		// implement me
		//		
		return 0;
	}
}
