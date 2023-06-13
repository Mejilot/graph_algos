ifeq ($(shell uname), Linux)
	CHKFLAGS=-lgtest -lgtest_main -pthread -lrt -lm -lsubunit
else
	CHKFLAGS=-lgtest -lgtest_main
endif

PF=maze/
DISTDIR=build
ZIPNAME=A2_SimpleNavigator

all: tests install 

graph_algorithms.a: clean
	g++ -c *.cc salesman.cc ants/*.cc
	ar rcs graph_algorithms.a *.o
	ranlib $@

install:
	@g++ graph_algorithms.cc graph.cc menu.cc salesman.cc ants/*.cc -o build -lstdc++fs -std=c++17
	./build

clean:
	@rm -rf *.o
	@rm -rf *.a
	@rm -rf test
	@rm -rf build

tests:
	@g++ graph_algorithms.cc graph.cc salesman.cc tests.cc ants/*.cc -o test $(CHKFLAGS) -lstdc++fs -std=c++17
	./test

style:
	cp ../materials/linters/.clang-format .
	clang-format -i *.cc ants/*.cc
	clang-format -i *.h ants/*.h
	clang-format -n *.cc ants/*.cc
	clang-format -n *.h ants/*.h
	rm .clang-format

.PHONY: style tests
