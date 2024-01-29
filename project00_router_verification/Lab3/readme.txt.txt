understand how to collect  output of DUT in TB.

implement generic code to capture the dut output in TB

implement unpack operations using streaming operator

Goal is to collect output packet of DUT(values on dut_outp  signal pin) from TB

Remember:
1] Router DUT sends out packet on dut_outp output pin
2] and outp_valid pin indicates the start and end of packet
3] we will collect all these values  of dut_outp when outp_valid is high ans store them in a queue and then unpack it using steaming into a packet.

do  not forget to empty the [outp_queue] queue after a packet is completely given and unpacket and stored in a packet variable

