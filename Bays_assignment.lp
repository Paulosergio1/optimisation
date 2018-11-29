\ENCODING=ISO-8859-1
\Problem name: Bays_assignment

Minimize
 obj: 1680 X_(ac1)01,(bay1)01_(ac2)01_(bay2)01
      + 2478 X_(ac1)01,(bay1)01_(ac2)01_(bay2)02
      + 3262 X_(ac1)01,(bay1)01_(ac2)01_(bay2)03
      + 480 X_(ac1)01,(bay1)01_(ac2)02_(bay2)01
      + 708 X_(ac1)01,(bay1)01_(ac2)02_(bay2)02
      + 932 X_(ac1)01,(bay1)01_(ac2)02_(bay2)03
      + 3040 X_(ac1)01,(bay1)01_(ac2)03_(bay2)01
      + 4484 X_(ac1)01,(bay1)01_(ac2)03_(bay2)02
      + 5902.66666666667 X_(ac1)01,(bay1)01_(ac2)03_(bay2)03
      + 2478 X_(ac1)01,(bay1)02_(ac2)01_(bay2)01
      + 1680 X_(ac1)01,(bay1)02_(ac2)01_(bay2)02
      + 2478 X_(ac1)01,(bay1)02_(ac2)01_(bay2)03
      + 708 X_(ac1)01,(bay1)02_(ac2)02_(bay2)01
      + 480 X_(ac1)01,(bay1)02_(ac2)02_(bay2)02
      + 708 X_(ac1)01,(bay1)02_(ac2)02_(bay2)03
      + 4484 X_(ac1)01,(bay1)02_(ac2)03_(bay2)01
      + 3040 X_(ac1)01,(bay1)02_(ac2)03_(bay2)02
      + 4484 X_(ac1)01,(bay1)02_(ac2)03_(bay2)03
      + 3262 X_(ac1)01,(bay1)03_(ac2)01_(bay2)01
      + 2478 X_(ac1)01,(bay1)03_(ac2)01_(bay2)02
      + 1680 X_(ac1)01,(bay1)03_(ac2)01_(bay2)03
      + 932 X_(ac1)01,(bay1)03_(ac2)02_(bay2)01
      + 708 X_(ac1)01,(bay1)03_(ac2)02_(bay2)02
      + 480 X_(ac1)01,(bay1)03_(ac2)02_(bay2)03
      + 5902.66666666667 X_(ac1)01,(bay1)03_(ac2)03_(bay2)01
      + 4484 X_(ac1)01,(bay1)03_(ac2)03_(bay2)02
      + 3040 X_(ac1)01,(bay1)03_(ac2)03_(bay2)03
      + 2880 X_(ac1)02,(bay1)01_(ac2)01_(bay2)01
      + 4248 X_(ac1)02,(bay1)01_(ac2)01_(bay2)02
      + 5592 X_(ac1)02,(bay1)01_(ac2)01_(bay2)03
      + 4248 X_(ac1)02,(bay1)02_(ac2)01_(bay2)01
      + 2880 X_(ac1)02,(bay1)02_(ac2)01_(bay2)02
      + 4248 X_(ac1)02,(bay1)02_(ac2)01_(bay2)03
      + 5592 X_(ac1)02,(bay1)03_(ac2)01_(bay2)01
      + 4248 X_(ac1)02,(bay1)03_(ac2)01_(bay2)02
      + 2880 X_(ac1)02,(bay1)03_(ac2)01_(bay2)03
      + 1980 X_(ac1)03,(bay1)01_(ac2)03_(bay2)01
      + 2920.5 X_(ac1)03,(bay1)01_(ac2)03_(bay2)02
      + 3844.5 X_(ac1)03,(bay1)01_(ac2)03_(bay2)03
      + 2920.5 X_(ac1)03,(bay1)02_(ac2)03_(bay2)01
      + 1980 X_(ac1)03,(bay1)02_(ac2)03_(bay2)02
      + 2920.5 X_(ac1)03,(bay1)02_(ac2)03_(bay2)03
      + 3844.5 X_(ac1)03,(bay1)03_(ac2)03_(bay2)01
      + 2920.5 X_(ac1)03,(bay1)03_(ac2)03_(bay2)02
      + 1980 X_(ac1)03,(bay1)03_(ac2)03_(bay2)03
Subject To
 Onebayperaircraft_ac_bay1_1:    X_(ac1)01,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)01,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)01,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)03_(bay2)03
                                 - 3 Slack01  = 0
 Onebayperaircraft_ac_bay1_2:    X_(ac1)01,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)03
                                 - 3 Slack02  = 0
 Onebayperaircraft_ac_bay1_3:    X_(ac1)01,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)01_(bay2)03
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)03
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)03
                                 - 3 Slack03  = 0
 Onebayperaircraft_ac_bay2_1:    X_(ac1)02,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)02,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)02,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)03_(bay2)03
                                 - 3 Slack04  = 0
 Onebayperaircraft_ac_bay2_2:    X_(ac1)02,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)03
                                 - 3 Slack05  = 0
 Onebayperaircraft_ac_bay2_3:    X_(ac1)02,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)01_(bay2)03
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)03
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)03
                                 - 3 Slack06  = 0
 Onebayperaircraft_ac_bay3_1:    X_(ac1)03,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)03,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)03,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)03_(bay2)03
                                 - 3 Slack07  = 0
 Onebayperaircraft_ac_bay3_2:    X_(ac1)03,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)03
                                 - 3 Slack08  = 0
 Onebayperaircraft_ac_bay3_3:    X_(ac1)03,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)01_(bay2)03
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)03
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)03
                                 - 3 Slack09  = 0
 Slack_Onebayperaircraft_ac_bay1: Slack01 + Slack02 + Slack03  = 1
 Slack_Onebayperaircraft_ac_bay2: Slack04 + Slack05 + Slack06  = 1
 Slack_Onebayperaircraft_ac_bay3: Slack07 + Slack08 + Slack09  = 1
 Connection_between_aircraft1_1: X_(ac1)01,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)01,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)01,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)01_(bay2)03  = 1
 Connection_between_aircraft1_2: X_(ac1)01,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)02_(bay2)03  = 1
 Connection_between_aircraft1_3: X_(ac1)01,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)01_(ac2)03_(bay2)03
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)02_(ac2)03_(bay2)03
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)01,(bay1)03_(ac2)03_(bay2)03  = 1
 Connection_between_aircraft2_1: X_(ac1)02,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)02,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)02,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)01_(bay2)03  = 1
 Connection_between_aircraft2_2: X_(ac1)02,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)02_(bay2)03  = 1
 Connection_between_aircraft2_3: X_(ac1)02,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)01_(ac2)03_(bay2)03
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)02_(ac2)03_(bay2)03
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)02,(bay1)03_(ac2)03_(bay2)03  = 1
 Connection_between_aircraft3_1: X_(ac1)03,(bay1)01_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)01_(bay2)03
                                 + X_(ac1)03,(bay1)02_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)01_(bay2)03
                                 + X_(ac1)03,(bay1)03_(ac2)01_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)01_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)01_(bay2)03  = 1
 Connection_between_aircraft3_2: X_(ac1)03,(bay1)01_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)02_(bay2)03
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)02_(bay2)03
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)02_(bay2)03  = 1
 Connection_between_aircraft3_3: X_(ac1)03,(bay1)01_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)01_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)01_(ac2)03_(bay2)03
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)02_(ac2)03_(bay2)03
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)01
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)02
                                 + X_(ac1)03,(bay1)03_(ac2)03_(bay2)03  = 1
Bounds
 0 <= X_(ac1)01,(bay1)01_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)01_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)02_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)01,(bay1)03_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)01_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)02_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)02,(bay1)03_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)01_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)02_(ac2)03_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)01_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)01_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)01_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)02_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)02_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)02_(bay2)03 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)03_(bay2)01 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)03_(bay2)02 <= 1
 0 <= X_(ac1)03,(bay1)03_(ac2)03_(bay2)03 <= 1
 0 <= Slack01 <= 1
 0 <= Slack02 <= 1
 0 <= Slack03 <= 1
 0 <= Slack04 <= 1
 0 <= Slack05 <= 1
 0 <= Slack06 <= 1
 0 <= Slack07 <= 1
 0 <= Slack08 <= 1
 0 <= Slack09 <= 1
Generals
 X_(ac1)01,(bay1)01_(ac2)01_(bay2)01  X_(ac1)01,(bay1)01_(ac2)01_(bay2)02 
 X_(ac1)01,(bay1)01_(ac2)01_(bay2)03  X_(ac1)01,(bay1)01_(ac2)02_(bay2)01 
 X_(ac1)01,(bay1)01_(ac2)02_(bay2)02  X_(ac1)01,(bay1)01_(ac2)02_(bay2)03 
 X_(ac1)01,(bay1)01_(ac2)03_(bay2)01  X_(ac1)01,(bay1)01_(ac2)03_(bay2)02 
 X_(ac1)01,(bay1)01_(ac2)03_(bay2)03  X_(ac1)01,(bay1)02_(ac2)01_(bay2)01 
 X_(ac1)01,(bay1)02_(ac2)01_(bay2)02  X_(ac1)01,(bay1)02_(ac2)01_(bay2)03 
 X_(ac1)01,(bay1)02_(ac2)02_(bay2)01  X_(ac1)01,(bay1)02_(ac2)02_(bay2)02 
 X_(ac1)01,(bay1)02_(ac2)02_(bay2)03  X_(ac1)01,(bay1)02_(ac2)03_(bay2)01 
 X_(ac1)01,(bay1)02_(ac2)03_(bay2)02  X_(ac1)01,(bay1)02_(ac2)03_(bay2)03 
 X_(ac1)01,(bay1)03_(ac2)01_(bay2)01  X_(ac1)01,(bay1)03_(ac2)01_(bay2)02 
 X_(ac1)01,(bay1)03_(ac2)01_(bay2)03  X_(ac1)01,(bay1)03_(ac2)02_(bay2)01 
 X_(ac1)01,(bay1)03_(ac2)02_(bay2)02  X_(ac1)01,(bay1)03_(ac2)02_(bay2)03 
 X_(ac1)01,(bay1)03_(ac2)03_(bay2)01  X_(ac1)01,(bay1)03_(ac2)03_(bay2)02 
 X_(ac1)01,(bay1)03_(ac2)03_(bay2)03  X_(ac1)02,(bay1)01_(ac2)01_(bay2)01 
 X_(ac1)02,(bay1)01_(ac2)01_(bay2)02  X_(ac1)02,(bay1)01_(ac2)01_(bay2)03 
 X_(ac1)02,(bay1)01_(ac2)02_(bay2)01  X_(ac1)02,(bay1)01_(ac2)02_(bay2)02 
 X_(ac1)02,(bay1)01_(ac2)02_(bay2)03  X_(ac1)02,(bay1)01_(ac2)03_(bay2)01 
 X_(ac1)02,(bay1)01_(ac2)03_(bay2)02  X_(ac1)02,(bay1)01_(ac2)03_(bay2)03 
 X_(ac1)02,(bay1)02_(ac2)01_(bay2)01  X_(ac1)02,(bay1)02_(ac2)01_(bay2)02 
 X_(ac1)02,(bay1)02_(ac2)01_(bay2)03  X_(ac1)02,(bay1)02_(ac2)02_(bay2)01 
 X_(ac1)02,(bay1)02_(ac2)02_(bay2)02  X_(ac1)02,(bay1)02_(ac2)02_(bay2)03 
 X_(ac1)02,(bay1)02_(ac2)03_(bay2)01  X_(ac1)02,(bay1)02_(ac2)03_(bay2)02 
 X_(ac1)02,(bay1)02_(ac2)03_(bay2)03  X_(ac1)02,(bay1)03_(ac2)01_(bay2)01 
 X_(ac1)02,(bay1)03_(ac2)01_(bay2)02  X_(ac1)02,(bay1)03_(ac2)01_(bay2)03 
 X_(ac1)02,(bay1)03_(ac2)02_(bay2)01  X_(ac1)02,(bay1)03_(ac2)02_(bay2)02 
 X_(ac1)02,(bay1)03_(ac2)02_(bay2)03  X_(ac1)02,(bay1)03_(ac2)03_(bay2)01 
 X_(ac1)02,(bay1)03_(ac2)03_(bay2)02  X_(ac1)02,(bay1)03_(ac2)03_(bay2)03 
 X_(ac1)03,(bay1)01_(ac2)01_(bay2)01  X_(ac1)03,(bay1)01_(ac2)01_(bay2)02 
 X_(ac1)03,(bay1)01_(ac2)01_(bay2)03  X_(ac1)03,(bay1)01_(ac2)02_(bay2)01 
 X_(ac1)03,(bay1)01_(ac2)02_(bay2)02  X_(ac1)03,(bay1)01_(ac2)02_(bay2)03 
 X_(ac1)03,(bay1)01_(ac2)03_(bay2)01  X_(ac1)03,(bay1)01_(ac2)03_(bay2)02 
 X_(ac1)03,(bay1)01_(ac2)03_(bay2)03  X_(ac1)03,(bay1)02_(ac2)01_(bay2)01 
 X_(ac1)03,(bay1)02_(ac2)01_(bay2)02  X_(ac1)03,(bay1)02_(ac2)01_(bay2)03 
 X_(ac1)03,(bay1)02_(ac2)02_(bay2)01  X_(ac1)03,(bay1)02_(ac2)02_(bay2)02 
 X_(ac1)03,(bay1)02_(ac2)02_(bay2)03  X_(ac1)03,(bay1)02_(ac2)03_(bay2)01 
 X_(ac1)03,(bay1)02_(ac2)03_(bay2)02  X_(ac1)03,(bay1)02_(ac2)03_(bay2)03 
 X_(ac1)03,(bay1)03_(ac2)01_(bay2)01  X_(ac1)03,(bay1)03_(ac2)01_(bay2)02 
 X_(ac1)03,(bay1)03_(ac2)01_(bay2)03  X_(ac1)03,(bay1)03_(ac2)02_(bay2)01 
 X_(ac1)03,(bay1)03_(ac2)02_(bay2)02  X_(ac1)03,(bay1)03_(ac2)02_(bay2)03 
 X_(ac1)03,(bay1)03_(ac2)03_(bay2)01  X_(ac1)03,(bay1)03_(ac2)03_(bay2)02 
 X_(ac1)03,(bay1)03_(ac2)03_(bay2)03  Slack01  Slack02  Slack03  Slack04 
 Slack05  Slack06  Slack07  Slack08  Slack09 
End
