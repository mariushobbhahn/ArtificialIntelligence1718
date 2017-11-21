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





;;
;; (a)
;;
;; Implement a heuristic function based on the data returned by
;; (get-coordinates city)
;;
(defun geo-heuristic (city goal)
    ;
    ; implement me!
    ;
  )


;;
;; (b)
;;
;; Implement A* graph search, the function's return value should
;; look like:
;; (path-length
;;  (start city1 city2 ... goal)
;;  (start cityA city1 cityB cityC city2 cityD ... goal))
;;
(defun a*-search (start goal h)
  "A*: Find a path from start to goal using the heuristic h"
    ;
    ; implement me!
    ;
  )

;;
;; (c)
;;
;; Calculate the shortest path from each city to Hamburg and fill them in in
;; the list below. Write a sentence (in comments) on what the most efficient
;; way to calculate this would be (Alternatively, you can implement this
;; efficient method instead of manually filling in the values in the list).
;;
(defun from-hamburg ()
  '((Hamburg 0)
    ;
    ; to be filled in
    ;
    )
  )
