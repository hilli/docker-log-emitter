package main

import (
	"log"
	"time"
)

func main() {
	for {
		log.Printf("The time is now: %s", time.Now())
		time.Sleep(time.Second)
	}
}
