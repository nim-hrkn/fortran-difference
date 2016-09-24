GFORTRAN = gfortran -cpp -fcheck=all -g 
IFORT = ifort -cpp -check all -g -traceback

all: alloc_test_g alloc_test_i alloc_test_i03

alloc_test_g: alloc_test.f90
	$(GFORTRAN) -o $@   $^
alloc_test_i: alloc_test.f90
	$(IFORT) -o $@  $^
alloc_test_i03: alloc_test.f90
	$(IFORT) -assume realloc_lhs -o $@ $^

clean:
	rm -f *.o alloc_test_g alloc_test_i alloc_test_i03

