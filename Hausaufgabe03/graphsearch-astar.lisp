(defparameter *cities* '(
  ( Aachen    Essen  Koblenz   Koeln )
  ( Augsburg    Garmisch-Part.   Muenchen   Stuttgart   Ulm )
  ( Bayreuth    Nuernberg   Wuerzburg )
  ( Berlin    Cottbus   Frankfurt/Oder   Magdeburg   Neubrandenburg  )
  ( Bremen    Hamburg   Hannover   Osnabrueck   Wilhelmshaven )
  ( Cottbus    Berlin   Dresden   Frankfurt/Oder )
  ( Chemnitz Erfurt Leipzig)
  ( Dresden    Cottbus   Leipzig )
  ( Erfurt    Kassel Chemnitz)
  ( Essen    Aachen   Koeln   Muenster   Osnabrueck )
  ( Frankfurt/Main    Fulda   Karlsruhe   Koblenz   Mannheim   Wuerzburg )
  ( Frankfurt/Oder    Berlin   Cottbus )
  ( Freiburg    Karlsruhe )
  ( Fulda    Frankfurt/Main   Kassel   Wuerzburg )
  ( Garmisch-Part.    Augsburg   Muenchen )
  ( Hamburg    Bremen   Kiel   Rostock   Schwerin )
  ( Hannover    Bremen   Magdeburg   Osnabrueck )
  ( Karlsruhe    Frankfurt/Main   Freiburg   Mannheim   Stuttgart )
  ( Kassel    Erfurt   Fulda )
  ( Kiel    Hamburg   Schwerin )
  ( Koblenz    Aachen   Frankfurt/Main   Koeln   Mannheim   Trier )
  ( Koeln    Aachen   Essen   Koblenz   Muenster )
  ( Leipzig    Dresden   Magdeburg Chemnitz)
  ( Lindau    Ulm )
  ( Magdeburg    Berlin   Hannover   Leipzig )
  ( Mannheim    Frankfurt/Main   Karlsruhe   Koblenz   Saarbruecken   Stuttgart   Trier )
  ( Muenchen    Augsburg   Garmisch-Part.   Regensburg   Ulm )
  ( Muenster    Essen   Koeln   Osnabrueck )
  ( Neubrandenburg     Berlin   Rostock )
  ( Nuernberg    Bayreuth   Regensburg   Wuerzburg )
  ( Osnabrueck    Bremen   Essen   Hannover   Muenster )
  ( Passau    Regensburg )
  ( Regensburg    Muenchen   Nuernberg   Passau )
  ( Rostock    Hamburg   Neubrandenburg    Schwerin )
  ( Saarbruecken    Mannheim   Trier )
  ( Schwerin    Hamburg   Kiel   Rostock )
  ( Stuttgart    Augsburg   Karlsruhe   Mannheim   Ulm )
  ( Trier    Koblenz   Mannheim   Saarbruecken )
  ( Ulm    Augsburg   Lindau   Muenchen   Stuttgart )
  ( Wilhelmshaven    Bremen )
  ( Wuerzburg    Bayreuth   Frankfurt/Main   Fulda   Nuernberg )
))


(defparameter *coordinates*
  '((AACHEN (-209.60379 249.47157))
    (AUGSBURG (134.80635 -18.575178))
    (BAYREUTH (179.32399 157.053))
    (BERLIN (293.09943 442.5178))
    (BREMEN (-16.931591 504.64734))
    (COTTBUS (361.43076 358.53146))
    (CHEMNITZ (269.5081 254.68588))
    (DRESDEN (325.56674 279.0941))
    (ERFURT (136.25624 271.9933))
    (ESSEN (-141.96866 325.35834))
    (FRANKFURT/MAIN (-27.608 175.58119))
    (FRANKFURT/ODER (371.03522 422.43652))
    (FREIBURG (-90.64952 -59.292046))
    (FULDA (43.13819 223.62091))
    (GARMISCH-PART. (152.07657 -114.76524))
    (HAMBURG (63.380383 558.3458))
    (HANNOVER (44.825264 426.9851))
    (KARLSRUHE (-48.82897 53.54009))
    (KASSEL (29.742897 308.71664))
    (KIEL (68.695816 643.33014))
    (KOBLENZ (-104.14378 201.43147))
    (KOELN (-148.25447 267.99976))
    (LEIPZIG (229.1317 311.15707))
    (LINDAU (45.822735 -109.21826))
    (MAGDEBURG (173.56235 398.0283))
    (MANNHEIM (-43.54089 105.24141))
    (MUENCHEN (184.8133 -44.536476))
    (MUENSTER (-98.30054 380.8315))
    (NEUBRANDENBURG (276.2144 557.0144))
    (NUERNBERG (145.11511 101.5798))
    (OSNABRUECK (-69.30297 415.89078))
    (PASSAU (322.74014 3.6142504))
    (REGENSBURG (220.39214 53.54009))
    (ROSTOCK (198.72835 616.2598))
    (SAARBRUECKEN (-150.04137 77.505005))
    (SCHWERIN (154.01888 565.11285))
    (STUTTGART (8.18225 27.57841))
    (TRIER (-173.55475 134.86357))
    (ULM (67.17258 -14.913567))
    (WILHELMSHAVEN (-62.93731 552.79846))
    (WUERZBURG (61.723507 140.4113))))


(defparameter *citydistance*  '(
  ( Aachen   ( Essen  123) ( Koblenz  145) ( Koeln  65))
  ( Augsburg   ( Garmisch-Part.  117) ( Muenchen  81) ( Stuttgart  149) ( Ulm  83))
  ( Bayreuth   ( Nuernberg  74) ( Wuerzburg  147))
  ( Berlin   ( Cottbus  125) ( Frankfurt/Oder  91) ( Magdeburg  131) ( Neubrandenburg   130))
  ( Bremen   ( Hamburg  110) ( Hannover  118) ( Osnabrueck  120) ( Wilhelmshaven  110))
  ( Chemnitz (Erfurt 160) (Leipzig 90))
  ( Cottbus   ( Berlin  125) ( Dresden  138) ( Frankfurt/Oder  119))
  ( Dresden   ( Cottbus  138) ( Leipzig  140))
  ( Erfurt   ( Kassel  135) ( Chemnitz 160))
  ( Essen   ( Aachen  123) ( Koeln  75) ( Muenster  87) ( Osnabrueck  135))
  ( Frankfurt/Main   ( Fulda  95) ( Karlsruhe  135) ( Koblenz  125) ( Mannheim  106) ( Wuerzburg  130))
  ( Frankfurt/Oder   ( Berlin  91) ( Cottbus  119))
  ( Freiburg   ( Karlsruhe  130))
  ( Fulda   ( Frankfurt/Main  95) ( Kassel  105) ( Wuerzburg  100))
  ( Garmisch-Part.   ( Augsburg  117) ( Muenchen  89))
  ( Hamburg   ( Bremen  110) ( Kiel  90) ( Rostock  150) ( Schwerin  120))
  ( Hannover   ( Bremen  118) ( Magdeburg  136) ( Osnabrueck  135))
  ( Karlsruhe   ( Frankfurt/Main  135) ( Freiburg  130) ( Mannheim  58) ( Stuttgart  81))
  ( Kassel   ( Erfurt  135) ( Fulda  105))
  ( Kiel   ( Hamburg  90) ( Schwerin  139))
  ( Koblenz   ( Aachen  145) ( Frankfurt/Main  125) ( Koeln  110) ( Mannheim  145) ( Trier  128))
  ( Koeln   ( Aachen  65) ( Essen  75) ( Koblenz  110) ( Muenster  144))
  ( Leipzig   ( Dresden  140) ( Magdeburg  108) ( Chemnitz 90))
  ( Lindau   ( Ulm  126))
  ( Magdeburg   ( Berlin  131) ( Hannover  136) ( Leipzig  108))
  ( Mannheim   ( Frankfurt/Main  106) ( Karlsruhe  58) ( Koblenz  145) ( Saarbruecken  117) ( Stuttgart  138) ( Trier  146))
  ( Muenchen   ( Augsburg  81) ( Garmisch-Part.  89) ( Regensburg  106) ( Ulm  124))
  ( Muenster   ( Essen  87) ( Koeln  144) ( Osnabrueck  60))
  ( Neubrandenburg    ( Berlin  130) ( Rostock  103))
  ( Nuernberg   ( Bayreuth  74) ( Regensburg  105) ( Wuerzburg  108))
  ( Osnabrueck   ( Bremen  120) ( Essen  135) ( Hannover  135) ( Muenster  60))
  ( Passau   ( Regensburg  128))
  ( Regensburg   ( Muenchen  106) ( Nuernberg  105) ( Passau  128))
  ( Rostock   ( Hamburg  150) ( Neubrandenburg   103) ( Schwerin  90))
  ( Saarbruecken   ( Mannheim  117) ( Trier  103))
  ( Schwerin   ( Hamburg  120) ( Kiel  139) ( Rostock  90))
  ( Stuttgart   ( Augsburg  149) ( Karlsruhe  81) ( Mannheim  138) ( Ulm  100))
  ( Trier   ( Koblenz  128) ( Mannheim  146) ( Saarbruecken  103))
  ( Ulm   ( Augsburg  83) ( Lindau  126) ( Muenchen  124) ( Stuttgart  100))
  ( Wilhelmshaven   ( Bremen  110))
  ( Wuerzburg   ( Bayreuth  147) ( Frankfurt/Main  130) ( Fulda  100) ( Nuernberg  108))
))


;;
;; Functions to get data about the graph
;;
(defun expand (city)
  "returns a list of neighbour cities of <city>"
  (rest (assoc city *cities*)))

(defun get-coordinates (city)
  "get the coordinates of a <city> in a flat coordinate system in km"
  (second (assoc city *coordinates*)))

(defun get-distance (city1 city2)
  "get the distance between two cities in km"
  (second (assoc city2 (rest (assoc city1 *citydistance*)))))


;;
;; A simple (and inefficient) priority queue based on a sorted list
;;
(defun pq-insert-all (pq nodes key)
  "Inserts all <nodes> into the priority queue <pq> according to <key>"
  (pq-sort-and-remove-duplicates (append pq nodes) key))

(defun pq-sort-and-remove-duplicates (list key)
  "Makes sure the queue is in order and contains no duplicates (by label). Always keeps the best entry"
  (remove-duplicates (stable-sort (copy-list list) #'< :key key) :key #'node-label :from-end T))


;;
;; It is useful to store information about a node in a struct:
;; 'label' contains the city name
;; 'g' and 'h' as defined in the lecture (with default values of 0)
;; 'parent' node to form a linked list containing the path travelled to this
;;     node (in reverse) or NIL if this is the start node
;; 'node-f' is not saved in the node struct to avoid situations where
;;     (node-g n) + (node-h n) != (node-f n)
;;
(defstruct (node) label (g 0.0) (h 0.0) parent)
(defun node-f (node) (+ (node-g node) (node-h node)))



;;
;; (a)
;;
;; Write a function 'expand-node' that takes the current node, the
;; heuristic function and the set of already explored nodes and returns the
;; list of the new nodes to be added to the frontier.
;;
;; The set of explored nodes is represented by an unordered list of node-structs.
;; you can use (find city explored :key #'node-label) to see whether a city is
;; in the list.
;;
(defun expand-node (current h explored)
  "current: the node-struct of the node to be expanded
   h: the heuristic function (taking a city label as an argument)
   explored: the set of already explored nodes"
   (apply (lambda (city)
          (if (find city-label explored :key #'node-label))
          nil
          (funcall h city-label))
              (expand current-label))
)


;;
;; (b)
;;
;; Implement a search step for A* in a function 'search-step':
;; It should use a priority queue to represent the frontier and use 'expand-nodes'
;; to generate the nodes to be added to the frontier. The recursive call of the
;; function should compute the next search step.
;;
;; When the search is finished, the function should return the goal node and the
;; explored set. If the search was unsuccessful it should return NIL instead of a
;; goal node.
;;
;; The simple priority queue implementation above is enough for this simple problem,
;; since the pq is just a sorted list, you can access its elements with 'first', 'rest', etc.
;;
(defun search-step (goal h frontier explored)
  "goal: the label of the goal city
   h: the heuristic function (taking a city label as an argument)
   frontier: priority queue containing the cities to be examined in order of f-values
   explored: the set of already explored nodes"
    (pq-insert-all
      (apply
        (lambda (city)
          (funcall h city)
            (expand-node (first frontier) h explored)))
              (node-f))
)



;;
;; (c)
;;
;; Implement an admissible heuristic function based on the data returned by
;; (get-coordinates city)
;; We use the direct distance that we get through pythagoras.
(defun geo-heuristic (city goal)
  (sqrt
    (+ (expt (- (first (get-coordinates city)) (first (get-coordinates goal))) 2)
       (expt (- (second (get-coordinates city)) (second (get-coordinates goal))) 2)))
)

;;(write (geo-heuristic Aachen Augsburg))

;;
;; (d)
;;
;; Using (a), (b) and (c), Implement A* graph search, on the graph of German
;; cities in this file. For the purpose of illustrating the algorithm, the
;; function should return the following information:
;; (path-length
;;  (list of cities along the path (in order from start to goal))
;;  (list of cities visited (in order from start to goal)))
;;
;; You should be able to extract this information from the values returned by 'search-step'
;;
(defun a*-search (start goal)
  "A*: Find a path from start to goal in this graph"

)

;;
;; (e)
;;
;; Implement a function that calculates the shortest path distance to any city
;; that can be reach from it and returns a list of all of them in ascending
;; order of distance, for example:
;; > (from-city 'Berlin)
;; ((Berlin 0) (Frankfurt/Oder 91) ...)
;;
(defun from-city (start)
  ;
  ; implement me!
  ;
)
