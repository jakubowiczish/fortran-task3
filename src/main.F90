program main
    use trapezoidal_rule_integration

    implicit none
    real(kind = 8) :: ibeg
    real(kind = 8) :: iend

    procedure(fun_int), pointer :: my_fun

    integer(kind = 8) :: p

    real(kind = 8) :: sum

    integer(kind = 8) :: i

    real(kind = 8), codimension[*] :: result_sine

    ibeg = -5.0
    iend = 7.0
    my_fun => sine





end program