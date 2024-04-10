# digital-electronics-1

## 2.lvl

### 3.lvl


# BTNC 

Tlačitko BTNC funguje jako zapináč posílaní signálu do reproduktoru a na schematu má oynačení START.
Podržením tlačitka BTNC kontrolujeme delku zvučení signálu když "delková "tlačitka jsou v nůle. 
Po nastavéní delky signálu pomocí tlačitek BTNL a BTNR pak zmačknutím spustíme signál a ten bude znět tu dobu, která byla nastavena. 

# BTNL/BTNR

"Tonová" tlačitka BTNL a BTNR fungují tak, že pomocí ně nastavíme delku znění tonu. BTNL ponižuje dobu trvaní tonu o 1 sekundu, BTNR naopak zvetšuje dobu trvaní o 1 sekundu. 

# SWITCHES

Switche mají na stárosti prepinání mezi noty (frekvenci).
Každý switch je zodpovědní za určitou frekvenci:
  - Do = 262 Hz => SW
  constant Do_freq: INTEGER := 262;
    constant Re_freq: INTEGER := 294;
    constant Mi_freq: INTEGER := 330;
    constant Fa_freq: INTEGER := 349;
    constant Sol_freq: INTEGER := 392;
    constant La_freq: INTEGER := 440;
    constant Si_freq: INTEGER := 494;
