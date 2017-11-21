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


(defun expand (city)
  "returns a list of neighbour cities of city"
  (rest (assoc city *cities*)))

(defun get-coordinates (city)
  "get the coordinates of a city"
  (second (assoc city *coordinates*)))

(defun get-distance (city1 city2)
  "get the distance between two cities"
  (second (assoc city2 (rest (assoc city1 *citydistance*)))))

;; straight line heuristic
(defun heuristic (city goal)
  (sqrt (reduce #'+ (mapcar (lambda (x) (* x x)) (mapcar #'- (get-coordinates city) (get-coordinates goal))))))

; construct node
(defstruct (node) label (g 0.0) (h 0.0) parent)
;; g, h with default-values
;; syntax to make node a:
;; (defvar a)
;; (setf a (make-node :label 'Ulm :g 0 :h 0 :parent 'Augsburg))

; calculate f-value of node
(defun node-f (node) (+ (node-g node) (node-h node)))

;;
;; (a)
;;
;; Implement RBFS, the function's return value should
;; look like:
;; (path-length
;;  (path list)
;;  (visited list))
;;
;; algorithm rbfs
;;
;; (a)
;;
;; Implement RBFS, the function's return value should
;; look like:
;; (path-length
;;  (path list)
;;  (visited list))
;;
;; algorithm rbfs
;; start of type node!
(defun rbfs (start goal)
    (helper start goal #'heuristic 1000000000 '() (list start) (list start) 0)
  )

;; creates list of successors and their f-values sorted by f-value
;; successor with best f-value is first
(defun succlist (current goal heuristic)
(labels ((succ_nodes (curr h goal)
			(loop for x in (expand (node-label curr)) collect 
					(make-node :label x
                    		   :g (+ (node-g curr) (get-distance x (node-label curr)))
                               :h (funcall h x goal)
                               :parent (node-label curr)))))
  (stable-sort (loop for y in (succ_nodes current heuristic goal) collect (list y (node-f y))) #'< :key #'cadr)))

;; helper realizes the rbfs-algorithm
;; arguments: start of type node
;;			 goal of is a city
;;			 heuristic is a function
;;			 f_limit of type number
;;			 alternative list of node(s)
;;			 path list of nodes
;;			 visited list of nodes
;;			 length of type number
(defun helper (start goal heuristic f_limit alternative path visited length)
  (if (eq (node-label start) goal)
      (list length (reverse (mapcar #'node-label path)) (remove-duplicates (mapcar #'node-label visited)))
	(let* ((succ (succlist start goal heuristic))
    	   (bestn (car(car succ)))
           (bestf (cadr(car succ)))
	       (second (cadr succ))
	   (instead (if (or (null alternative) (= (node-f(car alternative)) (max (cadr second) (node-f (car alternative)))))
		    (car second)
		    (car alternative))))
           (if (< bestf f_limit)
           	   (helper bestn 
               		   goal 
                       heuristic 
                       f_limit 
                       (list instead)
                       (append (list bestn) path)
                       (append (list bestn) visited)
                       (+ (get-distance (node-label start) (node-label bestn)) length))
            (labels ((unwind_path (root path) 
           		  (if (eq root (node-label (car path))) path (unwind_path root (cdr path))))) 	;corrects the path if needed
            (let* ((newpath (unwind_path (node-parent (car alternative)) path));corrected path
            (bestsibling (car (car (succlist (car newpath) goal heuristic))))) 	;bestsibling is a sibling of the alternative node, which was expanded before but underwent unwinding
           (helper (car alternative) ;current node = alternative node
               		 goal 
                     heuristic 
                    bestf 	;new f_limit = f-value of the best child before unwinding
                     (list bestsibling) 
                     (append (list (car alternative)) newpath) 	;insert next node to be expanded into path
                     (append (list (car alternative)) visited) 	;inser next node to be expanded into list of visited nodes
                     (+ (node-g (car newpath)) (get-distance (node-label (car newpath)) (node-label (car alternative)))))))))))	 ;new path-length is pathlength to parent of current node + distance between parent and node to be expanded





(defvar karl)
(setf karl (make-node :label 'Karlsruhe :g 0 :h 0 :parent 'Stuttgart))
(defvar mann)
(setf mann (make-node :label 'Mannheim :g 0 :h 0 :parent 'Karlruhe))
(defvar stuggi)
(setf stuggi (make-node :label 'Stuttgart :g 0 :h 0 :parent 'Ulm))
(defvar ulm)
(setf ulm (make-node :label 'Ulm :g 0 :h 0 :parent 'Augsburg))
(defvar aug)
(setf aug (make-node :label 'Augsburg :g 1 :h 1 :parent 'München))
(defvar mü)
(setf mü (make-node :label 'München :g 2 :h 2 :parent 'Regensburg))





  


