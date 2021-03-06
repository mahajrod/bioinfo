#!/bin/bash
# #!/bin/bash -x

TempID=$$
ScriptDir=..
Script=windowWig

# Complete set of variables used in tests; reset between tests

function ClearVariables()
{
    ThisTest=
    Input=
    CompressedInput=
    Expected=
    Output=
    Temp1=
    Temp2=
    Temp3=
}
ClearVariables

function RemoveTempFiles()
{
    rm -f $Temp1 $Temp2
    if [ "$Temp3" != "" ] ; then
        rm -f $Temp3
    fi
}
RemoveTempFiles


# -------------------------------- windowWig_test_01


ThisTest="windowWig_test_01"
echo -n $ThisTest - general test of script operation 
Input=windowWig_test_01.input
CompressedInput=windowWig_test_01.input.gz
if [ "$CompressedInput" != "" -a ! -f $Input ] ; then
    gzip -d -c < $CompressedInput > $Input
fi
Expected=windowWig_test_01.expected
Temp1=$ThisTest.$TempID.1
Temp2=$ThisTest.$TempID.2
$ScriptDir/$Script $Input > $Temp1
if diff $Temp1 $Expected ; then
    echo " - PASSED"
    RemoveTempFiles
    if [ "$CompressedInput" != "" ] ; then
        rm -f $Input
    fi
else
    echo " - FAILED"
fi
ClearVariables


# -------------------------------- windowWig_test_02


ThisTest="windowWig_test_02"
echo -n $ThisTest - input includes comment lines
Input=windowWig_test_02.input
CompressedInput=windowWig_test_02.input.gz
if [ "$CompressedInput" != "" -a ! -f $Input ] ; then
    gzip -d -c < $CompressedInput > $Input
fi
Expected=windowWig_test_02.expected
Temp1=$ThisTest.$TempID.1
Temp2=$ThisTest.$TempID.2
$ScriptDir/$Script $Input > $Temp1
if diff $Temp1 $Expected ; then
    echo " - PASSED"
    RemoveTempFiles
    if [ "$CompressedInput" != "" ] ; then
        rm -f $Input
    fi
else
    echo " - FAILED"
fi
ClearVariables


# -------------------------------- windowWig_test_03


ThisTest="windowWig_test_03"
echo -n $ThisTest - input includes comment and blank lines
Input=windowWig_test_03.input
CompressedInput=windowWig_test_03.input.gz
if [ "$CompressedInput" != "" -a ! -f $Input ] ; then
    gzip -d -c < $CompressedInput > $Input
fi
Expected=windowWig_test_03.expected
Temp1=$ThisTest.$TempID.1
Temp2=$ThisTest.$TempID.2
$ScriptDir/$Script $Input > $Temp1
if diff $Temp1 $Expected ; then
    echo " - PASSED"
    RemoveTempFiles
    if [ "$CompressedInput" != "" ] ; then
        rm -f $Input
    fi
else
    echo " - FAILED"
fi
ClearVariables


