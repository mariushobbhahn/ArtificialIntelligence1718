import random


def create_individual():
    individual = []
    for i in range(0,8):
        rnd = random.randrange(0,8)
        individual.append(rnd)
    return individual


def create_random_population(populationSize):
    arrayOfPlacements = []
    for i in range(0, populationSize):
        arrayOfPlacements.append(create_individual())
    return arrayOfPlacements


def count_horizontal_conflicts(individual):
    conflicts = 0
    for i in range(0, 8):
        for j in range(0, 8):
            if (j != i) and (individual[i] == individual[j]):
                conflicts += 1
    return conflicts


def count_diagonal_conflicts(individual):
    conflicts = 0
    for i in range(0, 8):
        for k in range(1, 7-i):
            compareCol = individual[i + k]
            if compareCol == k + individual[i]:      # up-right
                conflicts += 1
            elif compareCol == -k + individual[i]:   # down-right
                conflicts += 1
        for l in range(1, i):
            compareCol = individual[i - l]
            if compareCol == l + individual[i]:      # up-left
                conflicts += 1
            elif compareCol == -l + individual[i]:   # down-left
                conflicts += 1
    return conflicts


def count_conflicts(individual):
    return count_diagonal_conflicts(individual) + count_horizontal_conflicts(individual)


def calculate_fitness(individual):
    return 28 - count_conflicts(individual)


def calculate_sum_of_fitnesses(population):
    sumOfFitnesses = 0
    for individual in population:
        sumOfFitnesses += calculate_fitness(individual)
    return sumOfFitnesses


def mutate(individual):
    for i in range(0, 8):
        if random.randrange(0, 8) == 0:
            rndValue = random.randrange(0,8)
            individual[i] = rndValue


def calculate_parent_probability(individual, sumOfFitnesses):
    return calculate_fitness(individual) / sumOfFitnesses


def get_offspring(individual1, individual2):
    child = []
    for i in range(0,8):
        if i < 4:
            child.append(individual1[i])
        else:
            child.append(individual2[i])
    mutate(child)
    return child


def choose_parent(populationSize, ChooseWithParentProbability, cumulativeParentProbability):
    parent = []
    rnd = random.uniform(0, cumulativeParentProbability)
    for i in range(0, populationSize):
        if rnd > ChooseWithParentProbability[i][1]:
            continue
        else:
            parent = ChooseWithParentProbability[i][0]
    return parent


def like_slides_genetic_evolution(populationSize):
    population = create_random_population(populationSize)
    breakWhile = False
    generations = 0
    result = []

    while True:
        #
        # Reset values
        # ParProbs is short for ParentProbabilities
        #
        new_population = []
        cumulativeParProbs = 0
        individualsAndParProbs = []
        sumOfFitnesses = calculate_sum_of_fitnesses(population)

        # sumOfFitnesses can be 0 (bad for division)
        if not sumOfFitnesses:
            sumOfFitnesses = 1

        #
        # Accumulate parent_probabilites, so the program can randomly choose based on parent probabilities
        #
        for individual in population:
            cumulativeParProbs += calculate_parent_probability(individual, sumOfFitnesses)
            individualsAndParProbs.append([individual, cumulativeParProbs])

        #
        # Create 'populationSize'-new children
        #
        for individual in range(0, populationSize):
            # Choose Parent x
            x = choose_parent(populationSize, individualsAndParProbs, cumulativeParProbs)

            # Choose Parent y
            y = choose_parent(populationSize, individualsAndParProbs, cumulativeParProbs)

            # Create child
            child = get_offspring(x, y)
            if calculate_fitness(child) == 28:
                result = child
                breakWhile = True
                break
            new_population.append(child)

        # Replace old generation
        population = new_population
        generations += 1

        # Stop if we found a solution
        if breakWhile:
            break

    return [result, generations]



# for i in range(0, 10):
res = like_slides_genetic_evolution(5)
print(res[0], res[1])
