# UART 

> Universal Asynchronous Receiver Transmitter


## Baud rate generator

UART clock should be 16 times faster than the baud rate. For example, if the baud rate is 
set to 9600, the UART clock should be 16 times faster than 9600 baud.

## Error Detection 

> Framing Error(FE)

Raised if the receiver samples the position of the stop bit and it 
finds that it's not high(1)

> Overrun Error(ORE)

I don't understand this

> Parity Error(PE)

