all : run

CPPFLAGS += -I$(SYSTEMC_INCLUDE)

run: echo result.elf 
	./result.elf --stop-delta=1000000 --ieee-asserts=disable --wave=ghdl_wave.ghw

echo:
	echo $(CPPFLAGS)

result.elf: e~mwe.o adapter.o mwe_tb.o
	@echo "-------- Linking $^"
	$(CXX) -o $@ mwe_tb.o adapter.o $(SYSTEMC_LIBDIR)/libsystemc.a -lm -lrt `ghdl --list-link mwe`

e~mwe.o: mwe.o
	@echo "-------- Binding design"
	ghdl --bind mwe

mwe.o: mwe.vhdl
	@echo "-------- Compiling design"
	ghdl -a  mwe.vhdl

%.o:%.c
	@echo "-------- Compiling $(notdir $<)"
	$(CC) -c $< -o $@ 

%.o:%.cpp
	@echo "-------- Compiling $(notdir $<)"
	$(CXX) $(CPPFLAGS) -c $< -o $@ 

clean:
	rm -rf *.o
	rm -rf *.cf
	rm -rf *.lst
	rm -rf *.ghw
	rm -rf *.vcd
	rm -rf ./result.elf


