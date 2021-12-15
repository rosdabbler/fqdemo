## @file
# Demo of a custom message definition in a ros package.
#
# This message is supposed to be a simulation for a node that is like a message
# filter. That is, the node receives this message, and generates a response that
# is like a filtered version of the message.

## @noop Everything between @verbatim and @endverbatim shows up as the program listing.
## @noop Everything before shows up as the Detailed Description of the file.
## @verbatim

# Number to raise to a power or root
float64 num

# The exponent to use for power and root
float64 power

## @endverbatim