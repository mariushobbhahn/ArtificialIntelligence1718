;	Marc Tomasek
;	Marius Hobbhahn
;	Übungsblatt 4 - 8 Queens Problem



; (b) Tests with population sizes
; Population Size	Average Individuals	Sample Size
; 4						650.840					2	(takes long to calculate)
; 8						139.368					8	(fastest to calculate)
; 16						175.576					4
; 24						100.392					4
; 32						305.536					1	(takes forever to calculate)
;
; A population size of 4 seems too small to yield good results and 32 seems too large.
; 8 seemed to generate the best solution the fastest, the average value is high due to one outlier,
;	which needed 600.000 generations to find a solution.



; (a)
; Creating Individuals and Populations
(defun create_individual (i)
	"Create new inidividual by initializing with parameter (0)"
	(if (= i 8)
		'()
		(cons (random 8) (create_individual (+ i 1)))
	)
)



(defun create_population (size i)
	"Create a new population by initializing with parameters (populationSize 0)"
	(if (= i size)
		'()
		(cons (create_individual 0) (create_population size (+ i 1)))
	)
)



; Counting Conflicts
(defun count_horizontal_conflicts (individual conflicts i j already_checked_pos)
	"Initialize with (individual 0 0 0 '()) [Im sorry, this is so ugly]"
	(if (and (= i 8) (= j 8)) ; (2 nested for-loops, outer loop i, inner loop j)
		conflicts
		(if (= j 8)
			(count_horizontal_conflicts individual conflicts (+ i 1) 0 already_checked_pos)
			(if (= i 8)
				(count_horizontal_conflicts individual conflicts i (+ j 1) already_checked_pos)
				(if (and (not (= i j)) (= (elt individual i) (elt individual j)))
					(if (member j already_checked_pos) ; Avoid duplicates
						(count_horizontal_conflicts individual conflicts i (+ j 1) already_checked_pos)
						(count_horizontal_conflicts individual (+ conflicts 1) i (+ j 1) (cons i already_checked_pos))
					)
					(count_horizontal_conflicts individual conflicts i (+ j 1) already_checked_pos)
				)
			)
		)
	)
)



(defun diagonal_conflicts_above_help (individual conflicts i j)
	"Initialize with (individual 0 i i+1)"
	(if (= j 8)
		conflicts
		(if (= (elt individual j) (+ (elt individual i) (- j i)))
			(diagonal_conflicts_above_help individual (+ conflicts 1) i (+ j 1))
			(diagonal_conflicts_above_help individual conflicts i (+ j 1))
		)
	)
)



(defun count_diagonal_conflicts_above (individual conflicts i)
	"Counts diagonal conflicts above i: Initialize (individual 0 0)"
	(if (= i 7)
		conflicts
		(count_diagonal_conflicts_above
			individual
			(+
				conflicts
				(diagonal_conflicts_above_help individual 0 i (+ i 1)))
			(+ i 1)
		)
	)
)



(defun diagonal_conflicts_below_help (individual conflicts i j)
	"Initialize with (individual 0 i i+1)"
	(if (= j 8)
		conflicts
		(if (= (elt individual j) (- (elt individual i) (- j i)))
			(diagonal_conflicts_below_help individual (+ conflicts 1) i (+ j 1))
			(diagonal_conflicts_below_help individual conflicts i (+ j 1))
		)
	)
)



(defun count_diagonal_conflicts_below (individual conflicts i)
	"Counts diagonal conflicts to the left side of i: Initialize (individual 0 0 )"
	(if (= i 7)
		conflicts
		(count_diagonal_conflicts_below
			individual
			(+
				conflicts
				(diagonal_conflicts_below_help individual 0 i (+ i 1)))
			(+ i 1)
		)
	)
)



(defun count_diagonal_conflicts (individual)
	"Counts all diagonal conflicts"
	(+
		(count_diagonal_conflicts_above individual 0 0)
		(count_diagonal_conflicts_below individual 0 0)
	)
)



(defun count_conflicts (individual)
	"Counts all conflicts"
	(+
		(count_diagonal_conflicts individual)
		(count_horizontal_conflicts individual 0 0 0 '())
	)
)



(defun calculate_fitness (individual)
	"fitness function 28-#conflicts"
	(- 28 (count_conflicts individual))
)



(defun calculate_population_fitness (population fitness i)
	"Sums up the fitness of all individuals. Initialize (population 0 0)"
	(if (= i (list-length population))
		fitness
		(calculate_population_fitness
			population
			(+ fitness (calculate_fitness (elt population i)))
			(+ i 1)
		)
	)
)


; Choosing Parents and Creating Children
(defun replace_nth_position (individual position new_element)
	"Replaces the element at position of an individual with new_element"
	(cond
		((null individual)
			()
		)
		((= position 0)
			(cons new_element (rest individual))
		)
		(t
			(cons
				(first individual)
				(replace_nth_position
					(rest individual)
					(- position 1)
					new_element
				)
			)
		)
	)
)



(defun mutate (individual i)
	"Mutates a position in an individual with a probability of 1/8.
	Initialize (individual 0)"
	(if (= i 8)
		individual
		(if (= (random 8) 0)
			(mutate (replace_nth_position individual i (random 8)) (+ i 1))
			(mutate individual (+ i 1))
		)
	)
)



(defun calculate_parent_probability (individual populationFitness)
	"Calculates the probability to be chosen as a parent"
	(/ (calculate_fitness individual) populationFitness)
)



(defun create_child (individual1 individual2)
	"Creates child of individual1 and individual2"
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



(defun link_individual_to_parprob (population i)
	"Creates list in form of '((individual1 parprob) (individual2 parprob)...).
	Initialize with (population 0)"
	(let (
			(individual (nth i population))
			(populationFitness (calculate_population_fitness population 0 0))
		)
		(if (= i (list-length population))
			'()
			(if (= 0 populationFitness)
				(cons
						(list individual (/ 1 (list-length population)))
						(link_individual_to_parprob population (+ i 1))
				)
				(cons
					(list individual (calculate_parent_probability individual populationFitness))
					(link_individual_to_parprob population (+ i 1))
				)
			)
		)
	)
)



(defun link_population_with_cumulative_parProb (populationWithParProb)
	"Returns list in form of '((individual1 cumparprob) (individual2 cumparprob)...)
	We need cumulative parent probabilities for each individual in order to choose
	one based on probability"
	(setq cumParProb (second (first populationWithParProb)))
	(setq result (list (list (first (first populationWithParProb)) cumParProb)))
	(loop
		(setq populationWithParProb (rest populationWithParProb))
		(when (null populationWithParProb)
			(return (reverse result))
		)
		(setq cumParProb (+ cumParProb (second (first populationWithParProb))))
		(setq result (cons (list (first (first populationWithParProb)) cumParProb) result))
	)
)



(defun choose_parent (randomVariable populationWithCumulativeParProb)
	"Chooses one parent for new generation based on its fitness"
	(setq odds (second (first populationWithCumulativeParProb)))
	(setq individual (first (first populationWithCumulativeParProb)))
	(loop
		(when (<= randomVariable odds)
			(return individual))
		(setq populationWithCumulativeParProb (rest populationWithCumulativeParProb))
		(setq odds (second (first populationWithCumulativeParProb)))
		(setq individual (first (first populationWithCumulativeParProb)))
	)
)



(defun make_new_population (populationSize populationWithParProb)
	"Creates new population from old one"
	(loop for i from 1 to populationSize collect
		(create_child
			; individual1
			(choose_parent
				(random 1.0)
				(link_population_with_cumulative_parProb populationWithParProb)
			)
			; individual2
			(choose_parent
				(random 1.0)
				(link_population_with_cumulative_parProb populationWithParProb)
			)
		)
	)
)


; Main Functions
(defun get_best_individual (population)
	"Fishes the best individual out of the population.
	Returns list (bestIndividual bestFitness)"
	(setq bestIndividual (first population))
	(setq bestFitness (calculate_fitness bestIndividual))
	(setq population (rest population))
	(loop
		(setq individualToTest (first population))
		(setq fitnessOfTest (calculate_fitness individualToTest))
		(setq population (rest population))

		(if (> fitnessOfTest bestFitness)
			(prog
				(
					(idt individualToTest )
					(fot fitnessOfTest)
				)
				(setq bestIndividual idt)
				(setq bestFitness fot)
			)
		)

		(if (null population)
			(return (list bestIndividual bestFitness)))

	)
)



(defun genetic_evolution (population)
	"Returns list (bestIndividual generation)"
	(setq populationSize (list-length population))
	(setq generation 0)
	(loop
		(setq bestVector (get_best_individual population))
		(setq bestIndividual (first bestVector))
		(setq bestFitness (second bestVector))

		; Solution found: Break
		(when (= bestFitness 28)
			(return (list bestIndividual generation)))

		; New population, next generation
		(setq generation (+ generation 1))
		(setq population
			(make_new_population
				populationSize
				(link_individual_to_parprob population 0)
			)
		)

		; Print out best individual of current generation, its fitness and the current generation
		; (format t "Best ~S Fitness ~D Generation ~D~%" bestIndividual bestFitness generation)
	)
)

; Function call to start genetic evolution:
; (setq populationSize 8)
; (genetic_evolution (create_population populationSize 0))
