module testing_functions
    
    interface
        function fun_int(x) result(y)
            implicit none

            real(kind = 8), intent(in) :: x

            real(kind = 8) :: y

        end function fun_int

    end interface


    contains 


    function sine_fun(x) result(y)
        implicit none

        real(kind = 8), intent(in) :: x

        real(kind = 8) :: y

        y = sin(x)
    end function sine_fun


    function exponent_fun(x) result(y)
        implicit none

        real(kind = 8), intent(in) :: x

        real(kind = 8) :: y

        y = exp(x)
    end function exponent_fun

    
    function polynomial_fun(x) result(y)
        implicit none

        real(kind = 8), intent(in) :: x

        real(kind = 8) :: y

        y = x**5 + 4 * x**4 + 6 * x**3 + 4 * x**2 + 9 * x + 1
    end function polynomial_fun
    

    function polynomial_quotient_fun(x) result(y)
        implicit none

        real(kind = 8), intent(in) :: x

        real(kind = 8) :: y

        y = (x**3 - x**2) / (x - 20)
    end function polynomial_quotient_fun

end module