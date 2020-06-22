extends ProgressBar
var progress: bool
var timer: Timer
signal on_finished


func _ready():
	timer=Timer.new()

func start(waiting_time):
	timer.wait_time=waiting_time
	timer.one_shot=true
	self.add_child(timer)
	self.max_value=timer.wait_time
	self.value=0
	progress=true
	timer.start()
	yield(timer,"timeout")
	stop()
func cancel():
	timer.stop()
	self.visible=false
	progress=false
	
func stop():
	progress=false
	emit_signal("on_finished")
	self.hide()

func _process(delta):
	if progress:
		self.value=self.max_value-timer.time_left
