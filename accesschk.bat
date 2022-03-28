accesschk -w -s -q -u Users "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u Everyone "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u "Authenticated Users" "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u Interactive "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u "This Organization" "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u "Authentication authority asserted identity" "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Program Files" >> programfiles.txt
accesschk -w -s -q -u %username% "C:\Program Files" >> programfiles.txt

accesschk -w -s -q -u Users "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u Everyone "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u "Authenticated Users" "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u Interactive "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u "This Organization" "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u "Authentication authority asserted identity" "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Program Files (x86)" >> programfilesx86.txt
accesschk -w -s -q -u %username% "C:\Program Files (x86)" >> programfilesx86.txt

accesschk -w -s -q -u Users "C:\Windows" >> windows.txt
accesschk -w -s -q -u Everyone "C:\Windows" >> windows.txt
accesschk -w -s -q -u "Authenticated Users" "C:\Windows" >> windows.txt
accesschk -w -s -q -u Interactive "C:\Windows" >> windows.txt
accesschk -w -s -q -u "This Organization" "C:\Windows" >> windows.txt
accesschk -w -s -q -u "Authentication authority asserted identity" "C:\Windows" >> windows.txt
accesschk -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Windows" >> windows.txt
accesschk -w -s -q -u %username% "C:\Windows" >> windows.txt
