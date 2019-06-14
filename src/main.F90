program main
    use trapezoidal_rule_integration
    use testing_functions

    implicit none

    real(kind = 8) :: ibeg
    real(kind = 8) :: iend

    procedure(fun_int), pointer :: my_fun

    integer(kind = 4) :: p = 0

    real(kind = 8) :: result

    integer(kind = 8) :: i

    real(kind = 8), codimension[*] :: sine_integration_result

    real(kind = 8) :: length

    length = abs(iend - ibeg) / num_images()


    ibeg = -5.0
    iend = 7.0

    open(19, file='../res/integration_results.txt', status='unknown')

    if(this_image() == 1) then
        write(19, *)
        write(19, *) "Results of integration for following functions: "
        write(19, *) "y = sin(x) "
        write(19, *) "from "
        write(19, '(f6.2)') ibeg
        write(19, *) "to "
        write(19, '(f6.2)') iend
        write(19, *) "Method used - trapezoidal rule integration"
        write(19, *)

        write(*, *)
        write(*, *) "Results of integration for following functions: "
        write(*, *) "y = sin(x) "
        write(*, *) "from "
        write(*, '(f6.2)') ibeg
        write(*, *) "to "
        write(*, '(f6.2)') iend
        write(*, *) "Method used - trapezoidal rule integration"
        write(*, *)
    end if 


    my_fun => sine

    sine_integration_result[this_image()] = &
    & trapezoid_integration(ibeg + ((this_image() - 1) * length), ibeg + this_image() * length, my_fun, p)

    syncall()

    if (this_image() == 1) then
        result = 0.0

        do i = 1, num_images()
            result = result + sine_integration_result[i]
            write(*, *) sine_integration_result[i]
        end do

        write(19, *) "Result of integration for function: sin(x): ", result
        write(*, *) "Result of integration for function: sin(x): ", result
        
    end if


    close(19)


end program