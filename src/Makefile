IFORT=ifort -O3 -std08 -check bounds -coarray
SRC=main.F90
SRC_TRAPEZOID=trapezoidal_rule_integration.F90
SRC_RECTANGLE=rectangular_integration.F90
SRC_TESTING_FUNCTIONS=testing_functions.F90
OUT=test_integration


build: $(SRC) $(SRC_TRAPEZOID) $(SRC_RECTANGLE) $(SRC_TESTING_FUNCTIONS)
	$(IFORT) $(SRC) $(SRC_TRAPEZOID) $(SRC_RECTANGLE) $(SRC_TESTING_FUNCTIONS) -o $(OUT)


run: 
	make build
	./$(OUT)

clean:
	rm -f $(OUT)
	rm -f ../res/*.txt