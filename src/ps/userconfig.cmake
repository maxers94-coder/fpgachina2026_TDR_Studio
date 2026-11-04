# FW61 fractional timing/interpolation uses the standard math library.
list(APPEND USER_LINK_LIBRARIES m)
string(APPEND USER_COMPILE_OPTIONS " -fstack-usage")
