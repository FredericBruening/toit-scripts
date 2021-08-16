import gpio
import gpio.adc
import pubsub
import .LM35

ADC1 ::= gpio.Adc (gpio.Pin.in 33)
lm35_1 := LM35
topic := "cloud:temp1"

main:
    print "Running tasks"
    task:: read_lm35_1

read_lm35_1:
    while true:
        mV /float := 0.0
        
        out_of_range := catch:
            mV = ADC1.get
        if out_of_range:
            mV = lm35_1.mV

        lm35_1.update mV
        pubsub.publish topic "$lm35_1.temperature"
        sleep --ms=30000