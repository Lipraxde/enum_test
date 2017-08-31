CC  = gcc
CFLAGS += -Wall -std=c99
CSRC = c_enum_test.c
CEXE = c_enum_test.exe

CXX = g++ -std=c++11
CXXFLAGS += -Wall -fpermissive
CXXSRC = cpp_enum_test.cpp
CXXEXE = cpp_enum_test.exe

$(CEXE): $(CSRC)
	$(CC) $(CFLAGS) $< -o $@

$(CXXEXE): $(CXXSRC)
	$(CXX) $(CXXFLAGS) $< -o $@

all: $(CEXE) $(CXXEXE)
c_example: $(CEXE)
cpp_example: $(CXXEXE)

clean:
	rm -f $(CEXE) $(CXXEXE)

.PHONY : all, c_example, cpp_example, clean