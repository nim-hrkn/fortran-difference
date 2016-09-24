program test
 call main
contains

  subroutine main
  implicit none
  integer,allocatable:: iv(:)
  integer::iv2(5)
  write(*,*)'case 1'
  write(*,*)"allocated? before calling foo",allocated(iv)
  iv=foo(7)
  write(*,*)"allocated? after calling foo",allocated(iv)
  write(*,'(a,100i4)') ' iv=',iv

  write(*,*)
  write(*,*)'case 2'
  if (allocated(iv)) deallocate(iv); allocate(iv(8)); iv=0
  write(*,*) 'allocated size=',size(iv)
  iv=foo(5)
  write(*,*) 'now size=',size(iv)
  write(*,'(a,100i4)') ' iv=',iv

  write(*,*)
  write(*,*)'case 3'
  deallocate(iv); allocate(iv(8)); iv=0
  write(*,*) 'allocated size=',size(iv)
  iv(1:5)=foo(5)
  write(*,*) allocated(iv)
  write(*,*) 'now size=',size(iv)
  write(*,'(a,100i4)') ' iv=',iv

  write(*,*)
  write(*,*)'case 4'
  deallocate(iv); allocate(iv(8)); iv=0
  write(*,*) 'allocated size=',size(iv)
  iv(:)=foo(5)
  write(*,*) allocated(iv)
  write(*,*) 'now size=',size(iv)
  write(*,'(a,100i4)') ' iv=',iv

  write(*,*)
  write(*,*)'case 5'
  deallocate(iv); allocate(iv(8)); iv=0
  iv2=100
  iv(:)=iv2
  write(*,'(a,100i4)') ' iv=',iv

  write(*,*)
  write(*,*)'case 6'
  deallocate(iv); allocate(iv(3)); iv=0
  iv2=100
  iv(:)=iv2
  write(*,'(a,100i4)') ' iv=',iv

  stop 0
  end subroutine main

  function foo(i) result(val)
    implicit none
    integer:: i
    integer,allocatable :: val(:)
    write(*,*)'foo,i=',i
    allocate(val(i))
    val=100
  end function foo

end program test

