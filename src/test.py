import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

input_arr = [0b0000100, 0b0010000, 0b0100010, 0b0010100, 0b0110000, 0b0100011, 0b0000101, 0b0100000, 0b0001000, 0b0010011]
input_labels = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
@cocotb.test()
async def test_my_design(dut):

    dut._log.info("start simulation")

    # initialize clock
    clock = Clock(dut.clk, 1, units='ns')
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    for i in range(len(input_arr)):
        dut.ui_in.value = input_arr[i]
        await ClockCycles(dut.clk, 5)
        assert dut.uo_out.value == input_labels[i]
        dut._log.info(f"Passed test for {input_labels[i]}")

    dut._log.info("Finished test")