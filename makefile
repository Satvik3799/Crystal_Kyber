# === Configuration ===
CC = gcc
CFLAGS = -I./ -Iinclude -I./src
SRC = Crystal_Kyber.c $(wildcard src/*.c)
OUT = Crystal_Kyber

# === Targets ===

compile:
	$(CC) $(CFLAGS) $(SRC) -o $(OUT)

run: compile
	./$(OUT)

clean:
	rm -f $(OUT)
