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

end module