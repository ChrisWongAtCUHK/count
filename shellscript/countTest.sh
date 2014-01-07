# Obective: count the number of testcase in junit
# Necessary files
java_in=../tests/StackTest.java
txt_out=tests.txt 						# file cotains nodes(methods) names

# Constants
ta=@Test 					# @Test annotation

# If there is an input file
if [ "$1" != "" ]; then
	java_in="$1"
fi

# Clean up
rm -f ${txt_out}

# TODO: test

###	IMPORTANT: \ must be followed by \n, i.e. no comment is allowed
#	1. Read line with @Test, with the next line
#	2. Select the line wtih method name
#	3. Eliminate the commented line which should be not in use
#	4. Truncate the head of the line
#	5. Truncate the tail of the line
#	6. Remove leading space
#	7. Output to text file
(grep -A1 ${ta} ${java_in} | \
	grep "public void") | \
		grep -v '//' | \
			sed 's/^.*public void//g' | \
				sed 's/(.*$//g' | \
					sed 's/^ //g' \
					> ${txt_out}
