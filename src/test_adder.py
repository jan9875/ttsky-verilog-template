import cocotb

@cocotb.test()
async def test(dut):
    dut.in_1.value= 2
    dut.in_2.value= 3

    assert dut.Add_out.value==5