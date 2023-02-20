# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAMEE

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

  ![Screen](greater_than.png)

   Less than:

   ![Screen](less_than.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](greater_less.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **53**

```vhdl
     p_stimulus : process
   begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";

        -- First test case
        s_b <= "0101"; --  "0101" ID is 222953; pro 5.
        s_a <= "0011";        --  "0011" ID is 222953; pro 3.
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination b=5, a=3 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait;
    end process p_stimulus;

```

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/x/AwRN](https://www.edaplayground.com/x/AwRN)
