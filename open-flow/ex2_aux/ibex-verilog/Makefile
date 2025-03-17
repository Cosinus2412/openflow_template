PREFIX = ./ibex_out/src

INCLUDE = -I$(PREFIX)/lowrisc_dv_crypto_prince_ref_0.1 \
	-I$(PREFIX)/lowrisc_dv_dv_fcov_macros_0 \
	-I$(PREFIX)/lowrisc_dv_secded_enc_0 \
	-I$(PREFIX)/lowrisc_prim_assert_0.1/rtl \
	-I$(PREFIX)/lowrisc_prim_util_get_scramble_params_0/rtl \
	-I$(PREFIX)/lowrisc_prim_util_memload_0/rtl \
	-I$(PREFIX)/lowrisc_dv_scramble_model_0 \
	-I$(PREFIX)/lowrisc_dv_verilator_memutil_dpi_0/cpp \
	-I$(PREFIX)/lowrisc_dv_verilator_memutil_dpi_scrambled_0/cpp \
	-I$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl

RTL = 	$(PREFIX)/lowrisc_ibex_ibex_pkg_0.1/rtl/ibex_pkg.sv \
	$(PREFIX)/lowrisc_prim_abstract_prim_pkg_0.1/prim_pkg.sv \
	$(PREFIX)/lowrisc_prim_ram_1p_pkg_0/rtl/prim_ram_1p_pkg.sv \
	$(PREFIX)/lowrisc_prim_cipher_pkg_0.1/rtl/prim_cipher_pkg.sv \
	$(PREFIX)/lowrisc_prim_generic_buf_0/rtl/prim_generic_buf.sv \
	$(PREFIX)/lowrisc_prim_generic_clock_gating_0/rtl/prim_generic_clock_gating.sv \
	$(PREFIX)/lowrisc_prim_generic_flop_0/rtl/prim_generic_flop.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_pkg.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_22_16_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_22_16_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_28_22_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_28_22_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_39_32_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_39_32_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_64_57_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_64_57_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_72_64_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_72_64_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_22_16_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_22_16_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_39_32_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_39_32_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_72_64_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_72_64_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_76_68_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_76_68_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_22_16_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_22_16_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_28_22_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_28_22_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_39_32_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_39_32_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_64_57_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_64_57_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_72_64_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_72_64_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_22_16_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_22_16_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_39_32_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_39_32_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_72_64_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_72_64_enc.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_76_68_dec.sv \
	$(PREFIX)/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_76_68_enc.sv \
	$(PREFIX)/lowrisc_prim_xilinx_buf_0/rtl/prim_xilinx_buf.sv \
	$(PREFIX)/lowrisc_prim_xilinx_clock_gating_0/rtl/prim_xilinx_clock_gating.sv \
	$(PREFIX)/lowrisc_prim_xilinx_clock_mux2_0/rtl/prim_xilinx_clock_mux2.sv \
	$(PREFIX)/lowrisc_prim_xilinx_flop_0/rtl/prim_xilinx_flop.sv \
	$(PREFIX)/lowrisc_ibex_ibex_icache_0.1/rtl/ibex_icache.sv \
	$(PREFIX)/lowrisc_prim_abstract_buf_0/prim_buf.sv \
	$(PREFIX)/lowrisc_prim_abstract_clock_gating_0/prim_clock_gating.sv \
	$(PREFIX)/lowrisc_prim_abstract_flop_0/prim_flop.sv \
	$(PREFIX)/lowrisc_prim_cipher_0/rtl/prim_subst_perm.sv \
	$(PREFIX)/lowrisc_prim_cipher_0/rtl/prim_present.sv \
	$(PREFIX)/lowrisc_prim_cipher_0/rtl/prim_prince.sv \
	$(PREFIX)/lowrisc_prim_generic_clock_mux2_0/rtl/prim_generic_clock_mux2.sv \
	$(PREFIX)/lowrisc_prim_generic_ram_1p_0/rtl/prim_generic_ram_1p.sv \
	$(PREFIX)/lowrisc_prim_lfsr_0.1/rtl/prim_lfsr.sv \
	$(PREFIX)/lowrisc_prim_util_0.1/rtl/prim_util_pkg.sv \
	$(PREFIX)/lowrisc_prim_abstract_clock_mux2_0/prim_clock_mux2.sv \
	$(PREFIX)/lowrisc_prim_badbit_ram_1p_0/prim_badbit_ram_1p.sv \
	$(PREFIX)/lowrisc_prim_onehot_check_0/rtl/prim_onehot_check.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_alu.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_branch_predict.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_compressed_decoder.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_controller.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_cs_registers.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_csr.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_counter.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_decoder.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_ex_block.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_fetch_fifo.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_id_stage.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_if_stage.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_load_store_unit.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_fast.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_slow.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_prefetch_buffer.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_pmp.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_wb_stage.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_dummy_instr.sv \
	$(PREFIX)/lowrisc_ibex_ibex_core_0.1/rtl/ibex_core.sv \
	$(PREFIX)/lowrisc_prim_abstract_ram_1p_0/prim_ram_1p.sv \
	$(PREFIX)/lowrisc_prim_ram_1p_adv_0.1/rtl/prim_ram_1p_adv.sv \
	$(PREFIX)/lowrisc_prim_ram_1p_scr_0.1/rtl/prim_ram_1p_scr.sv \
	$(PREFIX)/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_ff.sv \
	$(PREFIX)/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_fpga.sv \
	$(PREFIX)/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_latch.sv \
	$(PREFIX)/lowrisc_ibex_ibex_top_0.1/rtl/ibex_lockstep.sv \
	$(PREFIX)/lowrisc_ibex_ibex_top_0.1/rtl/ibex_top.sv

TOP = "ibex_top"

RTL_SOC = ibex_pkg.sv \
	ibex_soc/ibex_soc_pkg.sv \
	ibex_soc/bus_if.sv \
	ibex_soc/ibex_soc.sv \
	ibex_soc/bus_arbiter2m1s.sv \
	ibex_soc/bus_mux1mNs.sv \
	ibex_soc/ram_wrapper.sv \
	ibex_soc/rom_wrapper.sv \
	ibex_soc/uart_wrapper.sv \
	ibex_soc/blinky_wrapper.sv \
	ibex_soc/cipher_wrapper.sv \
	ibex_soc/parallel_out.sv \
	ibex_soc/eoc_controller.sv

TOP_SOC = "ibex_soc"

ibex/ibex_top.core:
	@echo "'ibex/' seems to be empty, did you clone with submodules?"

ibex_out: ibex/ibex_top.core
	@echo "Make sure to install fusesoc!"
	fusesoc --cores-root ibex/ run --target=lint --setup --build-root ./ibex_out lowrisc:ibex:ibex_top

ibex_pkg.sv: ibex_out
	cp ./ibex_out/src/lowrisc_ibex_ibex_pkg_0.1/rtl/ibex_pkg.sv ./ibex_pkg.sv

ibex.v: ibex_out $(RTL)
	@echo "Make sure to install snylig!"
	yosys -p "plugin -i systemverilog; \
		read_systemverilog \
		--disable-feature=parametersubstitution \
		-parse \
		-DSYNTHESIS \
		+define+PRIM_DEFAULT_IMPL=prim_pkg::ImplGeneric \
		$(INCLUDE) $(RTL); \
		hierarchy -check -top ${TOP}; \
		proc; \
		opt; \
		write_verilog -noattr $@"

ibex_soc.v: ${RTL_SOC}
	@echo "Make sure to install sv2v!"
	sv2v -v \
	--define=SYNTHESIS \
	${RTL_SOC} \
	-w $@ \
        --top=${TOP_SOC}

program:
	$(MAKE) program0.vmem -C sw/
	$(MAKE) program1.vmem -C sw/

simulation: program ibex.v ibex_soc.v
	@echo "Make sure to install cocotb!"
	@mkdir -p sim_build
	@cp sw/program0.vmem sim_build/
	@cp sw/program1.vmem sim_build/
	python3 tb/tb_cocotb.py

clean:
	rm -rf ibex_out/
	rm -f ibex.v
	rm -f ibex_soc.v
	$(MAKE) -C sw clean

.PHONY: clean sw/program.vmem simulation program
