extends Node

enum InteractiveTypes {
	INTERACTIVE,
	PICKUP,
	ENTER,
	USE_KEY
}

# Важен порядок, иначе не будет работать связка +1 MAX_HP вместе с +1 HP
enum Effects {
	INCREASE_MAX_HP,
	INCREASE_HP,
	DECREASE_MAX_HP,
	DECREASE_HP,
}
