program main
    use trapezoidal_rule_integration
    use rectangular_integration
    use testing_functions

    implicit none

    real(kind = 8) :: ibeg = -1.0
    real(kind = 8) :: iend = 3.0

    procedure(fun_int), pointer :: my_fun

    integer(kind = 4) :: p = 0

    real(kind = 8) :: result

    integer(kind = 8) :: i

    real(kind = 8), codimension[*] :: sine_integration_result

    real(kind = 8), codimension[*] :: exponent_integration_result

    real(kind = 8), codimension[*] :: polynomial_integration_result

    real(kind = 8), codimension[*] :: polynomial_quotient_integration_result

    real(kind = 8) :: single_length

    single_length = abs(iend - ibeg) / num_images()


    open(19, file='../res/integration_results.txt', status='unknown')

    ! TRAPEZOIDAL INTEGRATION

    if(this_image() == 1) then
        write(19, *)
        write(19, *) "Results of integration for following functions: "
        write(19, *) "y = sin(x), y = e^x" 
        write(19, *) "y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1, y = (x**3 - x**2) / (x - 20)"
        write(19, *) "from "
        write(19, '(f6.2)') ibeg
        write(19, *) "to "
        write(19, '(f6.2)') iend
        write(19, *) "Method used - TRAPEZOIDAL rule integration"
        write(19, *)

        write(*, *)
        write(*, *) "Results of integration for following functions: "
        write(*, *) "y = sin(x), y = e^x" 
        write(*, *) "y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1, y = (x**3 - x**2) / (x - 20)"
        write(*, *) "from "
        write(*, '(f6.2)') ibeg
        write(*, *) "to "
        write(*, '(f6.2)') iend
        write(*, *) "Method used - TRAPEZOIDAL rule integration"
        write(*, *)
    end if 


    my_fun => sine_fun

    sine_integration_result[this_image()] = &
        trapezoid_integration(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => exponent_fun

    exponent_integration_result[this_image()] = &
        trapezoid_integration(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => polynomial_fun

    polynomial_integration_result[this_image()] = &
        trapezoid_integration(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => polynomial_quotient_fun

    polynomial_quotient_integration_result[this_image()] = &
        trapezoid_integration(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()


    if (this_image() == 1) then
        result = 0.0

        do i = 1, num_images()
            result = result + sine_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = sin(x): ", result
        write(*, *) "Result of integration for function: y = sin(x): ", result


        result = 0.0

        do i = 1, num_images()
            result = result + exponent_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = e^x: ", result
        write(*, *) "Result of integration for function: y = e^x: ", result


        result = 0.0

        do i = 1, num_images()
            result = result + polynomial_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1: ", result
        write(*, *) "Result of integration for function: y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1: ", result


        result = 0.0

        do i = 1, num_images()
            result = result + polynomial_quotient_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = (x**3 - x**2) / (x - 20): ", result
        write(*, *) "Result of integration for function: y = (x**3 - x**2) / (x - 20): ", result

    end if


    ! RECTANGULAR INTEGRATION

    if(this_image() == 1) then
        write(19, *)
        write(19, *) "Method used - RECTANGULAR integration"
        write(19, *)

        write(*, *)
        write(*, *) "Method used - RECTANGULAR integration"
        write(*, *)
    end if 


    my_fun => sine_fun

    sine_integration_result[this_image()] = &
        rectangular_integration_fun(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => exponent_fun

    exponent_integration_result[this_image()] = &
        rectangular_integration_fun(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => polynomial_fun

    polynomial_integration_result[this_image()] = &
        rectangular_integration_fun(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()

    my_fun => polynomial_quotient_fun

    polynomial_quotient_integration_result[this_image()] = &
        rectangular_integration_fun(ibeg + ((this_image() - 1) * single_length), ibeg + (this_image()) * single_length, my_fun, p)

    syncall()


    if (this_image() == 1) then
        result = 0.0

        do i = 1, num_images()
            result = result + sine_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = sin(x): ", result
        write(*, *) "Result of integration for function: y = sin(x): ", result


        result = 0.0

        do i = 1, num_images()
            result = result + exponent_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = e^x: ", result
        write(*, *) "Result of integration for function: y = e^x: ", result


        result = 0.0

        do i = 1, num_images()
            result = result + polynomial_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1: ", result
        write(*, *) "Result of integration for function: y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1: ", result


        result = 0.0

        do i = 1, num_images()
            result = result + polynomial_quotient_integration_result[i]
        end do

        write(19, *) "Result of integration for function: y = (x**3 - x**2) / (x - 20): ", result
        write(*, *) "Result of integration for function: y = (x**3 - x**2) / (x - 20): ", result

    end if


    close(19)

end program