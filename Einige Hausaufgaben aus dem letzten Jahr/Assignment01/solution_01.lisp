; (a)
(defun factorial (n)
  (if (< n 2)
      1
      (* n (factorial (1- n)))))

; (b)
(defun listSum (n s)
  (labels ((helper (i) (if (= i n) (list i) (cons i (helper (1+ i))))))
  (list
   (helper 1)
   (if (= s 0)
       (expt (floor (1+ n) 2) 2)
       (* (floor n 2) (1+ (floor n 2)))))))

; (c)
(defun scalarProduct (v1 v2)
  (if (/= (length v1) (length v2))
      NIL
      (reduce #'+ (mapcar #'* v1 v2))))

; (d)
(defun insert (l z p)
  (if (= p 0)
      (cons z l)
      (cons (first l) (insert (rest l) z (1- p)))))

; (e)
(defun mySort (l s) ; quicksort
  (if (null l) '()
      (let* ((dir (if (equal s 0) #'< #'>))
             (pivot (first l))
             (pred (lambda (x) (funcall dir x pivot)))
             (rec-l (mySort (remove-if-not pred (rest l)) s))
             (rec-r (mySort (remove-if pred (rest l)) s)))
        (append rec-l (cons (first l) rec-r)))))

(defun mySort2 (l s) ; selection sort
  (if (null l) '()
    (let ((sel (reduce (if (equal s 0) #'min #'max) l)))
      (cons sel (mySort2 (remove sel l :count 1) s)))))

(defun mySort3 (l s) ; insertion sort
  (labels ((insert-helper (a ll)
             (cond ((null ll) (list a))
                   ((funcall (if (= 0 s) #'< #'>) a (first ll)) (cons a ll))
                   (T (cons (first ll) (insert-helper a (rest ll)))))))
    (and l (insert-helper (first l) (mySort3 (rest l) s)))))
