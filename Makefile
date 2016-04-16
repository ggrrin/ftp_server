#$< first target prereqisitas
#$@ target
#$? all prerequisitas delimited by space

#CC=gcc
OPTS=-g -Wall -O0

BIN=./bin/
SRC=./src/

all: bin  $(BIN)server.out $(BIN)control_connection.out 
	ln -f $(BIN)server.out $(BIN)transport.out && mkdir -p $(BIN)root

bin:  
	mkdir -p $(BIN)

$(BIN)server.out: $(BIN)server.o $(BIN)helper_fnc.o 
	$(CC)  -o $(.TARGET) $(.ALLSRC) $(OPTS)

$(BIN)control_connection.out: $(BIN)control_connection.o $(BIN)login_cmd.o $(BIN)helper_fnc.o $(BIN)browse_cmd.o $(BIN)transport_cmd.o $(BIN)dir_cmd.o $(BIN)file_cmd.o $(BIN)transport_param_cmd.o
	$(CC)  -o $(.TARGET) $(.ALLSRC) $(OPTS)

$(BIN)control_connection.o: $(SRC)control_connection.c $(SRC)control_connection.h
	$(CC)  -c -o $(.TARGET) $(SRC)control_connection.c $(OPTS)
	
$(BIN)login_cmd.o: $(SRC)login_cmd.c $(SRC)login_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)login_cmd.c $(OPTS)

$(BIN)server.o: $(SRC)server.c $(SRC)helper_fnc.h
	$(CC)  -c -o $(.TARGET) $(SRC)server.c $(OPTS) 

$(BIN)helper_fnc.o: $(SRC)helper_fnc.c $(SRC)helper_fnc.h
	$(CC)  -c -o $(.TARGET) $(SRC)helper_fnc.c $(OPTS)

$(BIN)transport_cmd.o: $(SRC)transport_cmd.c $(SRC)transport_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)transport_cmd.c $(OPTS)

$(BIN)transport_param_cmd.o: $(SRC)transport_param_cmd.c $(SRC)transport_param_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)transport_param_cmd.c $(OPTS)

$(BIN)browse_cmd.o: $(SRC)browse_cmd.c $(SRC)browse_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)browse_cmd.c $(OPTS)

$(BIN)dir_cmd.o: $(SRC)dir_cmd.c $(SRC)dir_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)dir_cmd.c $(OPTS)

$(BIN)file_cmd.o: $(SRC)file_cmd.c $(SRC)file_cmd.h
	$(CC)  -c -o $(.TARGET) $(SRC)file_cmd.c $(OPTS)

#$(BIN).o: $(SRC).c $(SRC).h
#	$(CC)  -c -o $(.TARGET) $(.IMPSRC) $(OPTS)

clean: 
	rm -rf $(BIN)*
