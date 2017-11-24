;	Marc Tomasek
;	Marius Hobbhahn
;	Übungsblatt 4 - 8 Queens Problem

; ------------------- TODO ------------------
;
;    Implement diagonal conflict finding 		line 54, 61
;   Test the crap out of existing functions		line 79, 89, 96, 110, 123, 130
;           Implement parent finding 				line 148
;         Implement genetic evolution 			line 148
;
; ------------------- TODO -----------------



; Abgesegnet
(defun create_individual (i)
	"Create new inidividual by initializing with parameter (0)"
	(if (= i 8)
		'()
		(cons (random 8) (create_individual (+ i 1)))
	)
)


; Abgesegnet
(defun create_population (size i)
	"Create a new population by initializing with parameters (populationSize 0)"
	(if (= i size)
		'()
		(cons (create_individual 0) (create_population size (+ i 1)))
	)
)


; Abgesegnet
(defun count_horizontal_conflicts (individual conflicts i j)
	"Initialize with (individual 0 0 0)"
	(if (and (= i 8) (= j 8))
		conflicts
		(if (= j 8)
			(count_horizontal_conflicts individual conflicts (+ i 1) 0)
			(if (= i 8)
				(count_horizontal_conflicts individual conflicts i (+ j 1))
				(if (and (not (= i j)) (= (elt individual i) (elt individual j)))
					(count_horizontal_conflicts individual (+ conflicts 1) i (+ j 1))
					(count_horizontal_conflicts individual conflicts i (+ j 1))
				)
			)
		)
	)
)


; this will be bullshit
(defun count_diagonal_conflicts_to_right_side (individual conflicts i k)
	"Counts diagonal conflicts to the right side of i: Initialize (individual 0 0 0)"
	1
)


; this aswell
(defun count_diagonal_conflicts_to_left_side (individual conflicts i k)
	"Counts diagonal conflicts to the left side of i: Initialize (individual 0 0 0)"
	1
)


; Should be ok -- Needs Testing
(defun count_diagonal_conflicts (individual)
	"Counts all diagonal conflicts"
	(+ 
		(count_diagonal_conflicts_to_right_side (individual 0 0 0))
		(count_diagonal_conflicts_to_left_side (individual 0 0 0))
	)
)


; Should be ok -- Needs Testing
(defun count_conflicts (individual)
	"Counts all conflicts"
	(+ 
		(count_diagonal_conflicts(individual))
		(count_horizontal_conflicts(individual 0 0 0))
	)
)


; Should be ok -- Needs Testing
(defun calculate_fitness (individual)
	"fitness function 28-#conflicts"
	(- 28 (count_conflicts individual))
)


; Should be ok -- Needs Testing
(defun calculate_population_fitness (population fitness i)
	"Sums up the fitness of all individuals"
	(if (= i (list-length population))
		fitness
		(calculate_population_fitness 
			(population) 
			(+ fitness (calculate_fitness (elt population i)))
			(+ i 1)
		)
	)
)


; Should be ok -- Needs Testing
(defun mutate (individual i)
	"Mutates a position in an individual with a probability of 1/8"
	(if (= i 8)
		individual
		(if (= (random 8) 0)
			(setf (nth i individual) (random 8))
			(mutate individual (+ i 1))
		)
	)
)


; Should be ok -- Needs Testing
(defun calculate_parent_probability (individual populationFitness)
	"Calculates the probability to be chosen as a parent"
	(/ (calculate_fitness individual) populationFitness)
)


; Should be ok -- Needs Testing
(defun create_offspring (individual1 individual2)
	"Creates an offspring of individual1 and individual2"
	(mutate
		(list
			(first		individual1)
			(second	individual1)
			(third	individual1)
			(fourth	individual1)
			
			(first		individual2)
			(second	individual2)
			(third	individual2)
			(fourth	individual2)
		)
		0
	)
)

