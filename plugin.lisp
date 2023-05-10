$nyquist plug-in
$version 4
$type process
$preview linear
$name (_ "Presence effect")
$debugbutton true
$author (_ "Alexander Lelchuk")
$release 2.3.0-1
$copyright (_ "GNU General Public License v3.0")

;; Interface 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$control room_size (_ "Size of the room (m)") float-text "" 200 0 nil
$control coefficient (_ "Sound decay coefficient") float-text "" 0.6 0 nil
$control distortp (_ "Distort reflected sound?") choice ("Yes" "No")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar sound_speed 343.0)

(defun identity (x) x)
(defun get-abs-time (tm) (/ tm (get-duration 1.0)))
(defun stereo (mono) (vector (cue mono) (cue mono)))

; old versions: (sum 1 (scale -1 (ramp))); (sine 15 1.0); sin(x)/8 + 1/2
(defun distort (sig)
  (let ((fade (sum 1 (scale -1 (mult (/ 1.0 4) (sum 1 (sine 5 1.0))))))) ; 1/8; sin: (1 5 15 45 90)
    (sim (mult (cue fade) (cue sig))
         (stereo (scale 0.02 (noise 1.0))))))

(defun reflect (sig room_size coefficient distortp)
  (let* ((delay (* 2 (/ room_size sound_speed)))
         (echo (mult (- 1 coefficient) (cue sig)))
         (blank (const 0 (get-abs-time delay)))
         (buf (stereo blank)))
    (sim (seq (cue sig) (cue buf))
         (at (get-abs-time delay) 
             (funcall (if (zerop distortp) #'distort #'identity) 
                      (cue echo))))))
       ; (funcall (if (zerop distortp) #'distort #'identity) 
       ;     (at (get-abs-time delay) (cue echo)))))))

(reflect *track* room_size coefficient distortp)
