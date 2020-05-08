// Package hanabi implements the logic for playing the Hanabi board game
package hanabi

// Game holds info for the game
type Game struct{}

// New creates a new game
func New() *Game { return &Game{} }

func (Game) String() string { return "Hanabi" }
