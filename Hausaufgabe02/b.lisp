;	Marc Tomasek
;	Marius Hobbhahn
;	Übungsblatt 2

;
;	(a) addSort
;
(defun addElementwise (a b)
	"adds up elements of lists a and b element-wise"
	(if (null a)
		'()
		(cons (+ (car a) (car b)) (addElementwise (cdr a) (cdr b)))))
		
(defun addSort (a b)
	"adds lists a and b element-wise, then sorts the result and removes duplicates"
	(remove-duplicates (sort (addElementwise a b) #'<)))
;
;	(b) searchTree
;
(defun searchTreeCount (a tree level)
	"helper function to additionally store the current level of the search"
	(if (= (car tree) a)
		(list level)
		(append 	(if (not (null (second tree))) (searchTreeCount a (second tree) (+ level 1)))
						(if (not (null (third tree))) (searchTreeCount a (third tree) (+ level 1))))))
	
(defun searchTree (a tree)
	"looks for value a in the binary tree; if a is in the tree it returns its level - otherwise NIL"
	(if (= (car tree) a)
		1
		 (car (searchTreeCount a tree 1))))
;
;	(c) deleteTree ###
;
(defun deleteTree (a tree)
	"deletes all instances of value a from binary tree"
	(if (null (searchTree a tree))
		tree))
;
; 	(d) mapFilter
;
(defun mapFilter (a f)
	"applies function f on values of list a. Only not NIL values will be returned"
	(mapcar #'f a))