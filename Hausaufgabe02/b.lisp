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
(defun flatten (tree)
	"turns a tree (nested lists) into one flat list"
	(cond	((null tree) 				nil)
				((atom (car tree)) 	(cons (car tree) (flatten (cdr tree))))
				(t 								(append (flatten (car tree)) (flatten (cdr tree))))))

(defun removeNIL (liste)
	"removes unnecessary nil from the list"
	(if (and (null (car liste)) (null (cdr liste)))
		'()
		(if (null (car liste))
			(removeNIL (cdr liste))
			(cons (car liste) (removeNIL (cdr liste))))))

(defun removeElement (liste a)
	"removes given element a from list"
	(if (null (car liste))
		'()
		(if (= (car liste) a)
			(removeElement (cdr liste) a)
			(cons (car liste) (removeElement (cdr liste) a)))))

(defun insertIntoTree (element tree)
	"insert given element into pre-existing binary (search-)tree"
	(if (null (car tree))
		(list element nil nil)
		(if (< element (car tree))
			(list (car tree) (insertIntoTree element (second tree)) (third tree))
			(list (car tree) (second tree) (insertIntoTree element (third tree))))))

(defun buildTreeHelper (liste tree)
	"build a tree from a given list"
	(if (null (car liste))
		tree
		(buildTreeHelper (cdr liste) (insertIntoTree (car liste) tree))))

(defun buildTree (liste)
	"build a tree from a given list"
	(buildTreeHelper liste '(nil nil nil)))

(defun deleteTree (a tree)
	"deletes all instances of value a from binary tree"
	(if (null (searchTree a tree))
		tree
		(buildTree (removeElement (removeNIL (flatten tree)) a))))
;
; 	(d) mapFilter
;
(defun mapFilter (a f)
	"applies function f on values of list a. Only not NIL values will be returned"
	(if (null a)
		'()
		(if (not (null (funcall f (car a))))
			(cons (funcall f (car a)) (mapFilter (cdr a) f))
			(mapFilter (cdr a) f)
			)))

;(write ( mapFilter '(1 2 5 15 24 13 14)
;	( lambda ( x )
;		( if ( evenp x ) (1+ x ) nil ))))
