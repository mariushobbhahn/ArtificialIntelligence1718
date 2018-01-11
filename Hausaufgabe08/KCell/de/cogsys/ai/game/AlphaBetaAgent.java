package de.cogsys.ai.game;

import java.util.List;


public class AlphaBetaAgent<M,S> implements Agent<M,S> {

	private AlphaBetaHeuristic<M,S> heuristic;
	
	public AlphaBetaAgent(AlphaBetaHeuristic<M,S> heuristic) {
		this.heuristic = heuristic;
	}

	public AlphaBetaAgent() {
        this(null);
	}
	
	@Override
    public M computeMove(final Game<M,S> game) {
	    int DEPTH = 15;
        List<M> moves       = game.generateValidMoves();
        M       best        = null;
        double  best_value  = Double.NEGATIVE_INFINITY;

        for (M m : moves) {
            double value = min(game, Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, DEPTH-1);
            if (value > best_value){
                best = m;
                best_value = value;
            }
        }

        return best;
    }


    private double max(Game<M,S> game, double alpha, double beta, int depth) {
	    if (heuristic == null) {
	        if (game.ends()){
                return game.evaluate();
            }
        } else {
            if (heuristic.cutoff(game, depth))
                return heuristic.eval(game);
	    }
        double value = Double.NEGATIVE_INFINITY;
        List<M> moves = game.generateValidMoves();

        for (M m: moves) {
            value = Math.max(value, min(game.performMove(m), alpha, beta, depth-1));
            alpha = Math.max(alpha, value);
            if (beta <= alpha)
                break; // beta cut-off
        }
        return value;
    }

    private double min(Game<M,S> game, double alpha, double beta, int depth) {
        if (heuristic == null) {
            if (game.ends()){
                return game.evaluate();
            }
        } else {
            if (heuristic.cutoff(game, depth))
                return heuristic.eval(game);
        }
        double value = Double.POSITIVE_INFINITY;
        List<M> moves = game.generateValidMoves();

        for (M m: moves) {
            value = Math.min(value, max(game.performMove(m), alpha, beta, depth-1));
            beta = Math.min(beta, value);
            if (beta <= alpha)
                break; // alpha cut-off
        }
        return value;
    }

}
